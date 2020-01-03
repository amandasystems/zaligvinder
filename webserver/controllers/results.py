import webserver.views


class ResultController:
    def __init__(self,results):
        self._results = results

    def getSummaryForSolver (self,params):
        res = {}
        print (params)
        
        s = params["solver"]
        smtcalls,timeouted,satis,unk,nsatis,time,instances = self._results.getSummaryForSolver (s)
        res[s] = {'smtcalls' : smtcalls,
                  'timeouted' : timeouted,
                  'satisfied' : satis,
                  'not satisfied' :  nsatis,
                  'Unknown' : unk,
                  'time' : time,
                  'instances' : instances
            }
        return webserver.views.jsonview.JSONView (res)

    def getSummaryForSolverTrack (self,params):
        res = {}
        print (params)
        
        s = params["solver"]
        track = params["track"]
        smtcalls,timeouted,satis,unk,nsatis,time,instances = self._results.getSummaryForSolverTrack (s,track)
        res[s] = {'smtcalls' : smtcalls,
                  'timeouted' : timeouted,
                  'satisfied' : satis,
                  'not satisfied' :  nsatis,
                  'Unknown' : unk,
                  'time' : time,
                  'instances' : instances
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
        print (params)
        instances = self._results.getOutputForSolverInstance (params["solver"],params["instance"])
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
