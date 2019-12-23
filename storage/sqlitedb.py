
import sqlite3

class DB:
    def __init__(self,name):
        self.name = name
        self.conn = sqlite3.connect (name)

    def execute (self,query,inptuples = None):
        c = self.conn.cursor()
        if inptuples:
            c.execute (query,inptuples)
        else:
            c.execute (query)
        self.conn.commit ()

class TrackInstanceRepository:
    def __init__ (self,db):
        self._db = db
        self._id = 1
        
    def createSchema (self):
        query = '''Create Table TrackInstance (id INTEGER PRIMARY KEY, name TEXT,filepath TEXT)'''
        self._db.execute (query)

    def storeInstance (self,trackinstance):
        if not hasattr (trackinstance,'dbid'):
            query = '''INSERT INTO TrackInstance (id,name,filepath) Values (?,?,?)'''
            self._db.execute(query,(self._id,trackinstance.name,trackinstance.filepath))
            trackinstance.dbid = self._id
            self._id = self._id+1
        return trackinstance.dbid
        
class TrackRepository:
    def __init__ (self,db,instancerepo):
        self._db = db
        self._id = 1
        self.instancerepo = instancerepo
        
    def createSchema (self):
        query = '''Create Table Track (id INTEGER PRIMARY KEY, name TEXT)'''
        self._db.execute (query)
        query = '''Create Table TrackInstanceMap (track INTEGER, instance INTEGER)'''
        self._db.execute (query)
        
    def storeTrack (self,track):
        if not hasattr (track,'dbid'):
            query = '''INSERT INTO Track (id,name) Values (?,?)'''
            self._db.execute(query,(self._id,track.name))
            track.dbid = self._id
            self._id = self._id+1
            for inst in track.instances:
                tid = self.instancerepo.storeInstance (inst)
                query = '''INSERT INTO TrackInstanceMap (track,instance) Values (?,?)'''
                self._db.execute(query,(track.dbid,tid))
                
        return track.dbid

class ResultRepository:
    def __init__ (self,db,trackrepo,instancerepo):
        self._db = db
        self.instancerepo = instancerepo
        self.trackrepo = trackrepo

    def createSchema (self):
        query = '''Create Table Result (solver TEXT, instanceid INTEGER, smtcalls INTEGER, timeouted BOOLEAN,result BOOLEAN,time INTEGER)'''       
        self._db.execute (query)

    def storeResult (self,result,solver,instance):
        query = '''INSERT INTO Result (solver,instanceid,smtcalls,timeouted,result,time) VALUES(?,?,?,?,?,?)'''
        tid = self.instancerepo.storeInstance ( instance)
        self._db.execute (query,(solver,tid,result.smtcalls,result.timeouted,result.result,result.time))



class SQLiteDB:
    def __init__ (self,prefix = ""):
        from datetime import datetime
        timestamp = datetime.timestamp(datetime.now())
        self._db = DB(prefix+"_results_"+str(timestamp)+".db")
        self._instancerepo = TrackInstanceRepository (self._db)
        self._trackrepo = TrackRepository (self._db,self._instancerepo)
        self._resrepo = ResultRepository (self._db,self._trackrepo,self._instancerepo)
        for i in [self._instancerepo,self._trackrepo,self._resrepo]:
            i.createSchema ()
        
    def writeData (self,track,trackinstance,solvername,result):
        self._trackrepo.storeTrack (track)
        self._resrepo.storeResult (result,solvername,trackinstance)
        
        
        

