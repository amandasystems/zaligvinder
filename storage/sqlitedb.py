
import sqlite3
import utils

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
        
    def executeRet  (self,query,inptuples = None):
        c = self.conn.cursor()
        if inptuples:
            c.execute (query,inptuples)
        else:
            c.execute (query)
        return c.fetchall ()
        
class TrackInstanceRepository:
    def __init__ (self,db):
        self._db = db
        self._id = 1
        
    def createSchema (self):
        query = '''Create Table IF NOT EXISTS TrackInstance (id INTEGER PRIMARY KEY, name TEXT,filepath TEXT)'''
        self._db.execute (query)

    def storeInstance (self,trackinstance):
        if not hasattr (trackinstance,'dbid'):
            query = '''INSERT INTO TrackInstance (id,name,filepath) Values (?,?,?)'''
            self._db.execute(query,(self._id,trackinstance.name,trackinstance.filepath))
            trackinstance.dbid = self._id
            self._id = self._id+1
        return trackinstance.dbid

    def loadTrackInstance (self,id):
        query = '''SELECT * FROM TrackInstance WHERE id = ?'''
        rows = self._db.executeRet (query,(id,))
        assert(len(rows)==1)
        tin = utils.TrackInstance (rows[0][1],rows[0][2])
        tin.dbid = id
        return tin

    def loadAllInstances (self):
        query = '''SELECT id FROM TrackInstance '''
        rows = self._db.executeRet (query,)
        return [self.loadTrackInstance (id) for id, in rows]
    
class TrackRepository:
    def __init__ (self,db,instancerepo):
        self._db = db
        self._id = 1
        self.instancerepo = instancerepo
        
    def createSchema (self):
        query = '''Create Table  IF NOT EXISTS Track (id INTEGER PRIMARY KEY, name TEXT)'''
        self._db.execute (query)
        query = '''Create Table IF NOT EXISTS TrackInstanceMap (track INTEGER, instance INTEGER)'''
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

    def loadTrack (self,id):
        query = '''SELECT * FROM Track WHERE id = ?'''
        instancequery = '''SELECT * FROM TrackInstanceMap where track = ?'''
        rows = self._db.executeRet (query,(id,))
        assert(len(rows) == 1)
        tname = rows[0][1]
        rows = self._db.executeRet (instancequery,(id,))
        tinstances = [self.instancerepo.loadTrackInstance (instance) for (tid,instance) in rows]
        res = utils.Track (tname,tinstances)
        res.dbid = id
        return res

    def loadAllTracks (self):
        query = '''SELECT id FROM Track'''
        rows = self._db.executeRet (query)
        res = [self.loadTrack (i) for i, in rows]
        return res
    

class ResultRepository:
    def __init__ (self,db,trackrepo,instancerepo):
        self._db = db
        self.instancerepo = instancerepo
        self.trackrepo = trackrepo

    def createSchema (self):
        query = '''Create Table IF NOT EXISTS Result (solver TEXT, instanceid INTEGER, smtcalls INTEGER, timeouted BOOLEAN,result BOOLEAN,time INTEGER)'''       
        self._db.execute (query)

    def storeResult (self,result,solver,instance):
        query = '''INSERT INTO Result (solver,instanceid,smtcalls,timeouted,result,time) VALUES(?,?,?,?,?,?)'''
        tid = self.instancerepo.storeInstance ( instance)
        self._db.execute (query,(solver,tid,result.smtcalls,result.timeouted,result.result,result.time))

    def getSolvers (self):
        query = '''SELECT DISTINCT solver  FROM Result'''
        rows = self._db.executeRet (query)
        return [t[0] for  t in rows]

    def getResultForSolver (self,solver):
        query = '''SELECT * FROM Result WHERE solver = ? ORDER BY time ASC '''
        rows = self._db.executeRet (query,(solver,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    
    def getAllResults (self):
            query = '''SELECT * FROM Result ORDER BY time ASC '''
            rows = self._db.executeRet (query)
            print (rows)
            return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]
    
    def getTrackResults (self,trackid):
        query = '''SELECT Result.solver, Result.instanceid, Result.smtcalls, Result.timeouted, Result.result, Result.time FROM Result,Track, TrackInstanceMap WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = ? ORDER BY Result.time ASC'''
        
        rows = self._db.executeRet (query, (trackid,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]
        
    def getSummaryForSolver (self,solver):
        query = '''SELECT SUM(Result.smtcalls), SUM(Result.timeouted), SUM(Result.time),COUNT(*) FROM Result WHERE solver = ?'''
            
        rows = self._db.executeRet (query, (solver,))
        smtcalls,timeouted,time,total = rows[0]
        assert(len(rows) == 1)

        satisquery = ''' SELECT COUNT(*) FROM Result WHERE Solver = ? AND Result.result = true'''
        satis = self._db.executeRet (satisquery, (solver,))[0][0]

        unkquery = ''' SELECT COUNT(*) FROM Result WHERE Solver = ? AND Result.result IS NULL'''
        unk = self._db.executeRet (unkquery, (solver,))[0][0]

        nsatisquery = ''' SELECT COUNT(*) FROM Result WHERE Solver = ? AND Result.result = false'''
        nsatis = self._db.executeRet (nsatisquery, (solver,))[0][0]
        
        
        return (smtcalls,timeouted,satis,unk,nsatis,time,total) 
    
    def getSummaryForSolverTrack (self,solver,track):
        query = '''SELECT SUM(Result.smtcalls), SUM(Result.timeouted), SUM(Result.time),COUNT(*) FROM Result,TrackInstanceMap WHERE solver = ? AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
            
        rows = self._db.executeRet (query, (solver,track))
        assert(len(rows) == 1)                
        smtcalls,timeouted,time,total = rows[0]

        satisquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap WHERE Solver = ? AND Result.result = true AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
        satis = self._db.executeRet (satisquery, (solver,track))[0][0]

        unkquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap WHERE Solver = ? AND Result.result IS NULL AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
        unk = self._db.executeRet (unkquery, (solver,track))[0][0]

        nsatisquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap WHERE Solver = ? AND Result.result = false AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
        nsatis = self._db.executeRet (nsatisquery, (solver,track))[0][0]
        
        return (smtcalls,timeouted,satis,unk,nsatis,time,total) 
    
        
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

    def getDB (self):
        return self._db
            
    def writeData (self,track,trackinstance,solvername,result):
        self._trackrepo.storeTrack (track)
        self._resrepo.storeResult (result,solvername,trackinstance)
    
        
        

