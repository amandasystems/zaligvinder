import webserver.views


class ResultController:
    def __init__(self,results):
        self._results = results

    def getSummaryForSolver (self,params):
        res = {}
        #print (params)
        
        s = params["solver"]
        smtcalls,timeouted,satis,unk,nsatis,errors,time,instances = self._results.getSummaryForSolver (s)
        res["Summary"] = {
            'solver' : s,
            'smtcalls' : smtcalls,
            'timeouted' : timeouted,
            'satisfied' : satis,
            'not satisfied' :  nsatis,
            'error' : errors,
            'Unknown' : unk,
            'time' : time,
            'instances' : instances
            }
        return webserver.views.jsonview.JSONView (res)

    def getSummaryForSolverTrack (self,params):
        res = {}
        
        s = params["solver"]
        track = int(params["track"])
        bgroup = params.get("bgroup",[""])[0]
        #print ("PPPP",track,bgroup)
        smtcalls,timeouted,satis,unk,nsatis,errors,time,instances = self._results.getSummaryForSolverTrack (s,track) if track != 0 else self._results.getSummaryForSolverGroup (s,bgroup)
        res["Summary"] = {
            'solver' : s,
            'smtcalls' : smtcalls,
            'timeouted' : timeouted,
            'satisfied' : satis,
            'not satisfied' :  nsatis,
            'error': errors,
            'Unknown' : unk,
            'time' : time,
            'instances' : instances
            }
        return webserver.views.jsonview.JSONView (res)

    def getRanks(self,params):
        if "track" in params and int(params["track"]) != 0:
            data = self._results.getTrackInstancesClassification (params["track"])
        else:
            groups = list(self._results.getTrackInfo ().keys())
            if "bgroup" in params and params["bgroup"][0] in groups:
                bgroup = params["bgroup"][0]
            else:
                bgroup =  groups[0]
            data = self._results.getGroupInstancesClassification (bgroup)


        summaryData = dict()
        for iid in data:
            sortedData = sorted(data[iid], key=lambda tup: tup[4])
            for (solv,to,error,unk,time) in sortedData:
                i = 0
                if solv not in summaryData:
                    summaryData[solv] = 0

                # Points:
                # Timeouted: -1 point
                # Error: -5 Points
                # Unknown: 1 point
                # correct: 5 points / classification positon

                # stupid inlining :/
                if to:
                    summaryData[solv]-=1
                elif error:
                    summaryData[solv]-=5
                elif unk:
                    summaryData[solv]+=1
                else:
                    i+=1
                    summaryData[solv]+=(int(5/(i+1)))

        return webserver.views.jsonview.JSONView ([{"solver" : solv,
                                                    "points" : points,
                                                }
                                                   for solv, points in sorted(summaryData.items(), key=lambda item: item[1], reverse=True)])


    def getReferenceResult (self,params):
        ref = self._results.getReferenceForInstance (params["instance"])
        res = {'result' : ref.result,
               'satisfying solvers' : ref.satissolvers,
               'nsatisfying solvers' : ref.nsatissolvers
        }
        return webserver.views.jsonview.JSONView (res)
    
    def getAllResults (self,params):
        instances = self._results.getAllResults ()
        
        return webserver.views.jsonview.JSONView ([{"solver" : tt[0],
                                                    "instanceid" : tt[1],
                                                    "Result" : {
                                                        "smtcalls" : tt[2].smtcalls,
                                                        "timeouted" : tt[2].timeouted,
                                                        "result" : tt[2].result,
                                                        "time" : tt[2].time}
                                                    }
                                                     for tt in instances])
    
    def getOutput (self,params):
        #print (params)
        instances = self._results.getOutputForSolverInstance (params["solver"],params["instance"])
        return webserver.views.TextView.TextView (instances)

    def getModel (self,params):
        #print (params)
        instances = self._results.getModelForSolverInstance (params["solver"],params["instance"])
        return webserver.views.TextView.TextView (instances)
    
    
    def getTrackResults (self,params):
        if "track" in params:
            assert(len(params) == 1)
            instances = self._results.getTrackResults (params["track"])
            return webserver.views.jsonview.JSONView ([{"solver" : tt[0],
                                                        "instanceid" : tt[1],
                                                        "Result" : {
                                                            "smtcalls" : tt[2].smtcalls,
                                                            "timeouted" : tt[2].timeouted,
                                                            "result" : tt[2].result,
                                                        "time" : tt[2].time}
                                                    }
                                                       for tt in instances])
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})
        
    def getSolvers (self,params):
        return webserver.views.jsonview.JSONView (self._results.getSolvers ())

    def getInstanceIdsForTrack(self,params):
        if "track" in params:
            assert(len(params) == 1)
            instances = self._results.getInstanceIdsForTrack (params["track"])
            return webserver.views.jsonview.JSONView ([{"id" : tt[0]} for tt in instances])
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})

    def getInstanceIdsForGroup(self,params):
        if "bgroup" in params:
            assert(len(params) == 1)
            instances = self._results.getInstanceIdsForGroup (params["bgroup"])
            return webserver.views.jsonview.JSONView ([{"id" : tt[0]} for tt in instances])
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})

    def getTrackInfo(self,params):
        return webserver.views.jsonview.JSONView (self._results.getTrackInfo ()) 

    def _mapResultToIcon(self,result):
        iconMap = {0 : "times", 1 : "check", None : "unknown-status"}
        if result in iconMap:
            return iconMap[result]
        else:
            return "exclamation-triangle"

    def getResultForSolvers(self,params):
        if "solvers" in params and "instance" in params:
            iid = params["instance"]
            results = self._results.getInstanceResultForSolvers(iid,params["solvers"])
            data = dict()
            data[iid] = dict()
            resultSet = False
            expectedResult = None
            expectedResultSet = False
            instanceName = ""
            errorFound = 0
            classifications = []

            for tt in results:
                if expectedResult == None and not expectedResultSet:   
                    expectedResult = tt[2]   
                    if expectedResult != None:
                        expectedResultSet = True
                    instanceName = tt[3]
                error = 1 if expectedResult != tt[4].result and expectedResultSet and tt[4].result != None else 0
                errorFound = 1 if error == 1 or errorFound == 1 else 0
                data[iid][tt[0]] = { "smtcalls" : tt[4].smtcalls,
                                     "timeouted" : tt[4].timeouted,
                                     "result" : tt[4].result,
                                     "icon" : self._mapResultToIcon(tt[4].result),
                                     "time" : "%.2f" % tt[4].time,
                                     "error" : error,
                                     "unique_answer" : 0}
                if tt[4].result != None and error == 0:
                    classifications+=[tt[0]]
            if len(classifications) == 1 and expectedResult == None:
                data[iid][classifications[0]]["unique_answer"] = 1


            data[iid]["expected"] = expectedResult
            data[iid]["unique"] = 1 if len(classifications) == 1 else 0
            data[iid]["error"] = errorFound  
            data[iid]["name"] = instanceName                      
            data[iid]["unknown"] = 1 if len(classifications) == 0 else 0

            return webserver.views.jsonview.JSONView (data)
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})









