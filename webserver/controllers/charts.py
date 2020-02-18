import webserver.views.jsonview
import webserver.views.PNGView
import webserver.views.TextView
import webserver.views.ZIPView




class ChartController:
    def __init__(self,result):
        self._result = result

    def generateCactus(self,params,to_zip=None):
        no_unk = False

        if no_unk:
            results_for_solver_func=self._result.getResultForSolverGroup
            results_for_solver_track_func=self._result.getResultForSolverTrack
        else:
            results_for_solver_func=self._result.getResultForSolverGroupNoUnk
            results_for_solver_track_func=self._result.getResultForSolverTrackNoUnk


        rdata = {}
        avtracks = self._result.getTrackIds()
        activeGroup = list( self._result.getTrackInfo().keys() )[0]
        activeTrack = None

        # fetch solvers
        if "solver" in params:
            solvers = params["solver"]
        else:
            solvers = self._result.getSolvers ()

        # set group
        if "bgroup" in params:
            activeGroup = params["bgroup"][0]

        for solv in solvers:
            l = []

            # lookup track
            if "track" not in params or int(str(params["track"][0])) not in avtracks:
                res = results_for_solver_func(solv,activeGroup)
            else:
                track = int(str(params["track"][0]))
                activeTrack = [track[1] for track in self._result.getTrackNames() if track[0] == track][0]
                res = results_for_solver_track_func(solv,track)

            s = 0
            for i,data in enumerate(res):
                s = s+data[2].time
                l.append ({"x" : i,
                              "instance" : data[1],
                              "time" : data[2].time,
                              "y" : s
                              })
            rdata[solv] = l

        if "format" not in params:
            return webserver.views.jsonview.JSONView (rdata)
        else:
            form = params["format"][0]
            if form == "png":
                from matplotlib.figure import Figure
                from matplotlib.font_manager import FontProperties
                from io import BytesIO
                import itertools
                import random


                # colour setup
                colors = ["#25333D","#0065AB","#8939AD","#007E7A","#CD3517","#318700","#80746D","#FF9A69","#00D4B8","#85C81A", #none_5_z3str3
                  "#AC75C6","#0F1E82","#A3EDF6","#FFB38F","#49AFD9",]

                # extend the colors 
                r = lambda: random.randint(0,255)
                colorGen = lambda : '#%02X%02X%02X' % (r(),r(),r())
                while len(colors) < 26:
                  newColor = colorGen()
                  if newColor not in colors:
                    colors+=[newColor]



                it_cols = itertools.cycle(colors)

                fig = Figure(figsize=(6,3))
                ax = fig.subplots()

                fontP = FontProperties()
                fontP.set_size('small')

                for p in rdata.keys():
                    current_color = next(it_cols)
                    data = [i["y"] for i in rdata[p]]
                    ax.plot (range(0,len(data)),data,'-',linewidth=2.5,label=p,color=current_color)#,marker='.')
                    ax.fill_between(range(0,len(data)),data, color=current_color,alpha=0.15)
                    ax.legend(bbox_to_anchor=(0.25, 1.1))
                    ax.spines['top'].set_visible(False)
                    ax.spines['right'].set_visible(False)
                    ax.spines['bottom'].set_visible(False)
                    ax.spines['left'].set_visible(False)
                    ax.yaxis.grid(color='black', linestyle='dashdot', linewidth=0.1)
                    # Save it to a temporary buffer.
                    buf = BytesIO()
                if to_zip != None:
                    if activeTrack != None:
                        name = activeTrack
                    else:
                        name = activeGroup
                    fileName = name.lower().split(" ", 1)[0]+'.png'
                    fig.savefig(to_zip+"/"+fileName,format="png",dpi=160,prop=fontP)
                    return to_zip+"/"+fileName 
                else:
                    fig.savefig(buf, format="png",dpi=160,prop=fontP)
                    return webserver.views.PNGView.PNGView (buf)
            else:
                return webserver.views.TextView.ErrorText ("Unknown format")

    def downloadCactus(self,params):
        import tempfile
        import zipfile
        import shutil
        tmpFolder = tempfile.mkdtemp()
        fileList = []

        # only groups atm
        groups = list( self._result.getTrackInfo().keys() )
        for g in groups:
            fileList.append(self.generateCactus({"format":["png"],"bgroup":[g]},tmpFolder))

        """
        with zipfile.ZipFile('out.zip', 'w') as zipMe:        
            for file in fileList:
                zipMe.write(file, compress_type=zipfile.ZIP_DEFLATED)
        """
        #shutil.rmtree(tmpFolder)

        return webserver.views.TextView.ErrorText ("Images stored in " + tmpFolder)
        
    
    def generateTrackDistribution (self,params):
        rdata = {}

        group = params["bgroup"][0]
        
        if not isinstance(params["track"],list):
            track = int(params["track"])
        else:
            track = int(params["track"][0])


        if "solver" in params:
            solvers = params["solver"]
        else:
            #solvers = self._result.getSolvers ()
            if track != 0:
                solvers = self._result.getSolversForTrack(track)
            else:
                solvers = self._result.getSolversForGroup(group)


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

            



