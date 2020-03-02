1
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
        query = '''Create Table IF NOT EXISTS TrackInstance (id INTEGER PRIMARY KEY, name TEXT,filepath TEXT,expected BOOLEAN)'''
        self._db.execute (query)

    def storeInstance (self,trackinstance):
        if not hasattr (trackinstance,'dbid'):
            query = '''INSERT INTO TrackInstance (id,name,filepath,expected) Values (?,?,?,?)'''
            self._db.execute(query,(self._id,trackinstance.name,trackinstance.filepath,trackinstance.expected))
            trackinstance.dbid = self._id
            self._id = self._id+1
        else:
            query = '''UPDATE TrackInstance SET name = ?, filepath = ?, expected = ?  WHERE id = ?'''
            self._db.execute(query,(trackinstance.name,trackinstance.filepath,trackinstance.expected,trackinstance.dbid,))
        
        return trackinstance.dbid

    def loadTrackInstance (self,id):
        query = '''SELECT * FROM TrackInstance WHERE id = ?'''
        rows = self._db.executeRet (query,(id,))
        assert(len(rows)==1)
        tin = utils.TrackInstance (rows[0][1],rows[0][2],rows[0][3])
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
        query = '''Create Table  IF NOT EXISTS Track (id INTEGER PRIMARY KEY, name TEXT, bgroup TEXT)'''
        self._db.execute (query)
        query = '''Create Table IF NOT EXISTS TrackInstanceMap (track INTEGER, instance INTEGER)'''
        self._db.execute (query)
        
    def storeTrack (self,track):
        if not hasattr (track,'dbid'):
            query = '''INSERT INTO Track (id,name,bgroup) Values (?,?,?)'''
            self._db.execute(query,(self._id,track.name,track.benchmark))
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
        bname = rows[0][2]
        rows = self._db.executeRet (instancequery,(id,))
        tinstances = [self.instancerepo.loadTrackInstance (instance) for (tid,instance) in rows]
        res = utils.Track (tname,tinstances,bname)
        res.dbid = id
        return res

    def loadAllTracks (self):
        query = '''SELECT id FROM Track'''
        rows = self._db.executeRet (query)
        res = [self.loadTrack (i) for i, in rows]
        return res

    def getAllTrackIds (self):
        query = '''SELECT Track.id FROM Track'''
        return self._db.executeRet(query,)

    def getAllGroups (self):
        query = '''SELECT DISTINCT Track.bgroup FROM Track'''
        return self._db.executeRet(query,)
    

class ResultRepository:
    def __init__ (self,db,trackrepo,instancerepo):
        self._db = db
        self.instancerepo = instancerepo
        self.trackrepo = trackrepo

    def createSchema (self):
        query = '''Create Table IF NOT EXISTS Result (solver TEXT, instanceid INTEGER, smtcalls INTEGER, timeouted BOOLEAN,result BOOLEAN,time INTEGER,output TEXT,model TEXT,verified BOOLEAN)'''       
        self._db.execute (query)

    def storeResult (self,result,solver,instance):
        query = '''INSERT INTO Result (solver,instanceid,smtcalls,timeouted,result,time,output,model,verified) VALUES(?,?,?,?,?,?,?,?,?)'''
        tid = self.instancerepo.storeInstance ( instance)
        print("STORE:" + str(result.verified))
        self._db.execute (query,(solver,tid,result.smtcalls,result.timeouted,result.result,result.time,result.output,result.model,result.verified))

    def updateVerified(self,instanceid,solver,verified):
        query = '''UPDATE Result SET verified = ? WHERE solver = ? AND instanceid = ?'''
        self._db.execute(query,(verified,solver,instanceid,))

    def getSolvers (self):
        query = '''SELECT DISTINCT solver  FROM Result'''
        rows = self._db.executeRet (query)
        return [t[0] for  t in rows]

    def getSolversForTrack (self,trackid):
        query = '''SELECT DISTINCT solver  FROM Result,TrackInstanceMap WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = ?'''
        rows = self._db.executeRet (query,(trackid,))
        return [t[0] for  t in rows]

    def getSolversForGroup (self,bgroup):
        query = '''SELECT DISTINCT solver  FROM Result,TrackInstanceMap,Track WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = Track.id AND Track.bgroup = ?'''
        rows = self._db.executeRet (query,(bgroup,))
        return [t[0] for  t in rows]

    def getTrackIds (self):
        query = '''SELECT DISTINCT track  FROM TrackInstanceMap'''
        rows = self._db.executeRet (query)
        return [t[0] for  t in rows]

    def getTrackNames (self):
        query = '''SELECT DISTINCT Track.id, Track.name  FROM Track'''
        rows = self._db.executeRet (query)
        return [(t[0],t[1]) for  t in rows]

    def getTrackInfo (self):
        query = '''SELECT *  FROM Track'''
        rows = self._db.executeRet (query)
        data = dict()
        for (tid,tname,bgroup) in rows:
            if bgroup not in data:
                data[bgroup] = []
            data[bgroup]+= [(tid,tname)]
        return data

    def getInstanceIdsForTrack(self,trackid):
        print(trackid)
        query = '''SELECT DISTINCT TrackInstanceMap.instance  FROM TrackInstanceMap WHERE TrackInstanceMap.track = ?'''
        rows = self._db.executeRet (query,(int(trackid),))
        return [t[0] for t in rows] 


    def getInstanceIdsForGroup(self,bgroup):
        query = '''SELECT DISTINCT TrackInstanceMap.instance  FROM Track,TrackInstanceMap WHERE Track.bgroup = ? AND Track.id = TrackInstanceMap.track'''
        rows = self._db.executeRet (query,(bgroup,))
        return [t[0] for t in rows] 

    def getResultForSolver (self,solver):
        query = '''SELECT * FROM Result WHERE solver = ? ORDER BY time ASC '''
        rows = self._db.executeRet (query,(solver,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    def getResultForSolverGroup (self,solver,group):
        query = '''SELECT * FROM Result,TrackInstanceMap,Track WHERE solver = ? and Result.instanceid = TrackInstanceMap.instance and TrackInstanceMap.track = Track.id and Track.bgroup = ? ORDER BY time ASC '''
        rows = self._db.executeRet (query,(solver,group,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    def getResultForSolverTrack (self,solver,track):
        query = '''SELECT Result.* FROM Result,TrackInstanceMap WHERE Result.solver = ? and Result.instanceid = TrackInstanceMap.instance and TrackInstanceMap.track = ? ORDER BY time ASC '''
        rows = self._db.executeRet (query,(solver,track))

        #for t in rows:
        #    print(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2]).result)


        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    def getInstanceNameToId(self,instanceid):
        query = '''SELECT TrackInstance.name FROM TrackInstance WHERE TrackInstance.id = ?'''
        row = self._db.executeRet (query,(str(instanceid),))
        return row[0][0]

    def getResultForSolverNoUnk (self,solver):
        query = '''SELECT * FROM Result,TrackInstance WHERE solver = ? and Result.result IS NOT NULL AND  Result.instanceid = TrackInstance.id AND TrackInstance.expected == Result.result ORDER BY time ASC '''
        rows = self._db.executeRet (query,(solver,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    def getResultForSolverGroupNoUnk (self,solver,group):
        query = '''SELECT * FROM Result,TrackInstanceMap,Track,TrackInstance WHERE solver = ? AND TrackInstance.id = Result.instanceid AND TrackInstance.expected = Result.result AND Result.result IS NOT NULL and Result.instanceid = TrackInstanceMap.instance  and TrackInstanceMap.track = Track.id and Track.bgroup = ?  ORDER BY time ASC '''
        rows = self._db.executeRet (query,(solver,group,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    def getResultForSolverTrackNoUnk (self,solver,track):
        query = '''SELECT Result.* FROM Result,TrackInstanceMap,TrackInstance WHERE Result.solver = ? AND TrackInstance.id = Result.instanceid AND TrackInstance.expected = Result.result AND Result.result IS NOT NULL and Result.instanceid = TrackInstanceMap.instance and TrackInstanceMap.track = ? ORDER BY time ASC '''
        rows = self._db.executeRet (query,(solver,track))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    
    def getAllResults (self):
            query = '''SELECT * FROM Result ORDER BY time ASC '''
            rows = self._db.executeRet (query)
            #print (rows)
            return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]


    # faster classification
    def get2ComparisonTrackResultsFasterClassified(self,trackid,solver1,solver2):
        query = '''SELECT Result.solver, Result.instanceid, Result.timeouted, Result.result, TrackInstance.expected,Result.time FROM Result,TrackInstance,TrackInstanceMap WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = ? AND TrackInstance.id = Result.instanceid AND Result.solver = ?'''
        dataSolver1 = self._prepareClassificationData(self._db.executeRet (query, (trackid,solver1)))
        dataSolver2 = self._prepareClassificationData(self._db.executeRet (query, (trackid,solver2)))
    
        data = dict()
        for iid in dataSolver1:
            assert(len(dataSolver1[iid]) == 1 and len(dataSolver2[iid]) == 1)

            if dataSolver1[iid][0][2] or dataSolver2[iid][0][2]:
                continue





            if dataSolver1[iid][0][4] > dataSolver2[iid][0][4]+1.0:
                data[iid] = [dataSolver1[iid][0]] + [dataSolver2[iid][0]]
            #else: 
            #    data[iid] = [dataSolver2[iid][0]]


        return data

    def getTrackResults (self,trackid):
        query = '''SELECT Result.solver, Result.instanceid, Result.smtcalls, Result.timeouted, Result.result, Result.time FROM Result,Track,TrackInstanceMap WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = ? ORDER BY Result.time ASC'''
    
        rows = self._db.executeRet (query, (trackid,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    def getComparisonResultsForTrack(self,trackid,solvers):
        placeholders= ', '.join("?" for s in solvers)
        query = '''SELECT Result.solver, Result.instanceid, Result.smtcalls, Result.timeouted, Result.result, Result.time FROM Result,Track,TrackInstanceMap WHERE Result.solver IN (%s) AND Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = ? ORDER BY Result.time ASC''' % placeholders
    
        rows = self._db.executeRet (query, (solvers,trackid,))
        return [(t[0],t[1],utils.Result(t[4],t[5],t[3],t[2])) for t in rows]

    def getTrackInstancesClassification (self,trackid):
        query = '''SELECT Result.solver, Result.instanceid, Result.timeouted, Result.result, TrackInstance.expected,Result.time FROM Result,TrackInstance,TrackInstanceMap WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = ? AND TrackInstance.id = Result.instanceid'''
        return self._prepareClassificationData(self._db.executeRet (query, (trackid,)))

    def getGroupInstancesClassification (self,broup):
        query = '''SELECT Result.solver, Result.instanceid, Result.timeouted, Result.result, TrackInstance.expected,Result.time FROM Result,TrackInstance,TrackInstanceMap,Track WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = Track.id AND Track.bgroup = ? AND TrackInstance.id = Result.instanceid'''
        return self._prepareClassificationData(self._db.executeRet (query, (broup,)))

    def _prepareClassificationData(self,rows):
        data = dict()
        for (solv,iid,to,res,exp,time) in rows:
            if iid not in data:
                data[iid] = []
            error = res != None and exp != res
            unk = not to and res == None
            data[iid]+=[(solv,to,error,unk,time)]
        return data

    # TODO: Remove Errors as soon as available and refactor
    def _getUniquelyClassifiedInstancesHelper(self,query,trackid=None):
        if trackid != None:
            rows = self._db.executeRet (query,(trackid))
        else:
            rows = self._db.executeRet (query)
        to_bool = lambda x: True if x==1 else False
        data = dict()

        for (solver,iid,res) in rows:
            if solver not in data:
                data[solver] = []
            data[solver]+=[(iid,to_bool(res))]
        return data

    def getUniquelyClassifiedInstances(self):
        query = '''SELECT Result.solver, Result.instanceid, Result.result FROM Result WHERE Result.result IS NOT NULL GROUP BY Result.instanceid,Result.result HAVING COUNT(Result.result) = 1'''
        return self._getUniquelyClassifiedInstancesHelper(query)

    def getUniquelyClassifiedInstancesForTrack(self,trackid):
        query = '''SELECT Result.solver, Result.instanceid, Result.result FROM Result,TrackInstanceMap WHERE Result.instanceid = TrackInstanceMap.instance AND TrackInstanceMap.track = ? AND Result.result IS NOT NULL GROUP BY Result.instanceid,Result.result HAVING COUNT(Result.result) = 1'''
        return self._getUniquelyClassifiedInstancesHelper(query,str(trackid))

    def getInstanceResultForSolvers(self,instanceid,solvers):
        paramsStr = ', '.join("?" for s in solvers)
        querylist = [instanceid] + solvers
        query = '''SELECT Result.*,TrackInstance.expected,TrackInstance.Name FROM Result,TrackInstance WHERE Result.instanceid = ? AND Result.instanceid = TrackInstance.id  AND Result.solver IN (%s) ORDER BY time ASC ''' % paramsStr
        rows = self._db.executeRet (query,(querylist))
        return [(t[0],t[1],t[9], t[10], utils.Result(t[4],t[5],t[3],t[2],t[6],t[7],t[8]),t[6]) for t in rows]
        
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

        errorquery = ''' SELECT COUNT(*) FROM Result,TrackInstance WHERE solver = ? AND Result.result != TrackInstance.expected AND Result.result IS NOT NULL AND TrackInstance.id = Result.instanceid ''' 
        errors = self._db.executeRet (errorquery, (solver,))[0][0]
        
        
        return (smtcalls,timeouted,satis,unk,nsatis,errors,time,total) 

    def getSummaryForSolverGroup (self,solver,group):
        query = '''SELECT SUM(Result.smtcalls), SUM(Result.timeouted), SUM(Result.time),COUNT(*) FROM Result,TrackInstanceMap,Track WHERE solver = ? and Result.instanceid = TrackInstanceMap.instance  and TrackInstanceMap.track = Track.id and Track.bgroup = ? '''
            
        rows = self._db.executeRet (query, (solver,group,))
        smtcalls,timeouted,time,total = rows[0]
        assert(len(rows) == 1)

        satisquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap,Track WHERE solver = ? and Result.instanceid = TrackInstanceMap.instance  and TrackInstanceMap.track = Track.id and Track.bgroup = ?  AND Result.result = true'''
        satis = self._db.executeRet (satisquery, (solver,group,))[0][0]

        unkquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap,Track WHERE solver = ? and Result.instanceid = TrackInstanceMap.instance  AND Result.timeouted = false and TrackInstanceMap.track = Track.id and Track.bgroup = ? AND Result.result IS NULL'''
        unk = self._db.executeRet (unkquery, (solver,group,))[0][0]

        nsatisquery = ''' SELECT COUNT(*)  FROM Result,TrackInstanceMap,Track WHERE solver = ? and Result.instanceid = TrackInstanceMap.instance  and TrackInstanceMap.track = Track.id and Track.bgroup = ? AND Result.result = false'''
        nsatis = self._db.executeRet (nsatisquery, (solver,group,))[0][0]

        errorquery = ''' SELECT COUNT(*) FROM Result,TrackInstance,TrackInstanceMap,Track WHERE Result.solver = ? AND Result.result IS NOT NULL AND Result.instanceid = TrackInstance.id AND TrackInstance.expected != Result.result AND TrackInstance.id = TrackInstanceMap.instance AND TrackInstanceMap.track = Track.id AND Track.bgroup = ?''' 
        errors = self._db.executeRet (errorquery, (solver,group,))[0][0]
        

        print(timeouted+satis+unk+nsatis+errors)
        

        return (smtcalls,timeouted,satis,unk,nsatis,errors,time,total) 

    def getOutputForSolverInstance (self,solver,instance):
        query = '''SELECT output  FROM Result WHERE solver = ? AND instanceid = ?'''
        out = self._db.executeRet (query,(solver,instance))[0][0]
        if hasattr(out,'decode'):
            return out.decode('utf8')
        else:
            return self._db.executeRet (query,(solver,instance))[0][0]


    def getModelForSolverInstance (self,solver,instance):
        query = '''SELECT model  FROM Result WHERE solver = ? AND instanceid = ?'''
        out = self._db.executeRet (query,(solver,instance))[0][0]
        if hasattr(out,'decode'):
            return out.decode('utf8')
        else:
            return self._db.executeRet (query,(solver,instance))[0][0]
    
        
    def getSummaryForSolverTrack (self,solver,track):
        query = '''SELECT SUM(Result.smtcalls), SUM(Result.timeouted), SUM(Result.time),COUNT(*) FROM Result,TrackInstanceMap WHERE solver = ? AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
        rows = self._db.executeRet (query, (solver,str(track)))
        assert(len(rows) == 1)                
        smtcalls,timeouted,time,total = rows[0]

        satisquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap WHERE Solver = ? AND Result.result = true AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
        satis = self._db.executeRet (satisquery, (solver,track))[0][0]

        unkquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap WHERE Solver = ? AND Result.result IS NULL AND Result.timeouted = false AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
        unk = self._db.executeRet (unkquery, (solver,track))[0][0]

        nsatisquery = ''' SELECT COUNT(*) FROM Result,TrackInstanceMap WHERE Solver = ? AND Result.result = false AND TrackInstanceMap.track = ? AND TrackInstanceMap.instance = Result.instanceid'''
        nsatis = self._db.executeRet (nsatisquery, (solver,track))[0][0]

        errorquery = ''' SELECT COUNT(*) FROM Result,TrackInstance,TrackInstanceMap WHERE Result.solver = ? AND Result.result IS NOT NULL AND Result.instanceid = TrackInstance.id AND TrackInstance.expected != Result.result AND TrackInstance.id = TrackInstanceMap.instance AND TrackInstanceMap.track = ?''' 
        errors = self._db.executeRet (errorquery, (solver,track))[0][0]

        #total = timeouted+satis+unk+nsatis+errors
        
        return (smtcalls,timeouted,satis,unk,nsatis,errors,time,total) 

    def getReferenceForInstance (self,instance):
        query = '''SELECT result,Solver FROM Result WHERE instanceid = ? '''
        rows = self._db.executeRet (query, (instance,))
        sat = []
        nsat = []
        for r in rows:
            if r[0] == True:
                sat.append(r[1])
            elif r[1] == False:
                nsat.append(r[1])
        res = None
        if len(sat) > len(nsat):
            res = True
        elif len(nsat) > len(sat):
            res = False
        return utils.ReferenceResult (res,sat,nsat)
        
        
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
    

    def postTrackUpdate (self,track,res):
        for s in res.keys():
            for i,r in enumerate(res[s]):
                print(i,r.verified)
        
        for i,t in enumerate(track.instances):
            iid = self._instancerepo.storeInstance(t)
            for s in res:
                r = res[s]
                if r[i].result == True:
                    self._resrepo.updateVerified(iid,s,r[i].verified)
        

