import webserver.views.jsonview
import webserver.views.PNGView
import webserver.views.TextView




class ChartController:
    def __init__(self,result):
        self._result = result

    def generateCactus(self,params):
        rdata = {}
        if "solver" in params:
            solvers = params["solver"]
        else:
            solvers = self._result.getSolvers ()
        group = params["bgroup"][0]
        track = int(params["track"][0])
        print ("Chart",group,track)
        if "nounk" not in params:
            results_for_solver_func=self._result.getResultForSolverGroup
            results_for_solver_track_func=self._result.getResultForSolverTrack
        else:
            results_for_solver_func=self._result.getResultForSolverGroupNoUnk
            results_for_solver_track_func=self._result.getResultForSolverTrackNoUnk
            
        for solv in solvers:
            res = results_for_solver_func (solv,group) if track==0 not in params else results_for_solver_track_func (solv,params["track"][0]) 
            list = []
            s = 0
            for i,data in enumerate(res):
                s = s+data[2].time
                list.append ({"x" : i,
                              "instance" : data[1],
                              "time" : data[2].time,
                              "y" : s
                              })
            rdata[solv] = list
        return webserver.views.jsonview.JSONView (rdata)
        
    
    def generateTrackDistribution (self,params):
        rdata = {}
        if "solver" in params:
            solvers = params["solver"]
        else:
            solvers = self._result.getSolvers ()
        group = params["bgroup"][0]
        track = int(params["track"][0])
        for solv in solvers:
            smtcalls,timeouted,satis,unk,nsatis,errors,time,total = self._result.getSummaryForSolverTrack (solv,track) if track != 0 else self._result.getSummaryForSolverGroup (solv,group) 
            #smtcalls,timeouted,satis,unk,nsatis,errors,time,total = self._result.getSummaryForSolverTrack (solv,params["track"])
            
            rdata[solv] = {"satis" : satis,
                           "unk" : unk,
                           "nsatis" : nsatis
            }
            
        if "format" not in params:
            return webserver.views.jsonview.JSONView (rdata)
        else:
            form = params["format"][0]
            if form == "png":
                
                from matplotlib.figure import Figure
                from io import BytesIO
                import numpy as np
                fig = Figure()
                ax = fig.subplots()
                index = np.arange(3)
                bar_width = 0.8/len(solvers)
                opacity = 0.8
                c = 0
                for p in rdata.keys():
                    r = rdata[p]
                    res = (r["satis"],r["unk"],r["nsatis"])
                    ax.bar(index+c*bar_width, res, bar_width,
                                     alpha=opacity,
                                     label=p)
                    c = c+1

                ax.set_xticks(index)
                ax.set_xticklabels(["Satis","Unknown","NSatis"])
                ax.legend()
                # Save it to a temporary buffer.
                buf = BytesIO()
                fig.savefig(buf, format="png")
                return webserver.views.PNGView.PNGView (buf)
            else:
                return webserver.views.TextView.ErrorText ("Unknown format")

            



