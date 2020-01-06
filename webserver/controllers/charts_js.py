import webserver.views.jsonview
import webserver.views.PNGView
import webserver.views.TextView




class ChartControllerJS:
    def __init__(self,result):
        self._result = result

    def generateCactusData(self,params):
        rdata = {}
        if "solver" in params:
            solvers = params["solver"]
        else:
            solvers = self._result.getSolvers ()

        for solv in solvers:
            list = []
            avtracks = self._result.getTrackIds()

            if "track" not in params or int(str(params["track"][0])) not in avtracks:
                res = self._result.getResultForSolver (solv)
            else:
                track = int(str(params["track"][0]))
                res = self._result.getResultForSolverTrack(solv,track)
         
            s = 0
            for i,data in enumerate(res):
                s = s+data[2].time
                list.append (s)

            rdata[solv] = list

        return rdata
        #return webserver.views.jsonview.JSONView (rdata)

        #return webserver.views.TextView.TextView (str(rdata))


    def generateCactus(self,params):
        rdata = self.generateCactusData(params)

        outputstr = '''
        <!DOCTYPE html>
        <html>
          <head>
            <title></title>
            <link rel="stylesheet" href="files/libs/chartist/dist/chartist.min.css">
          </head>
          <body>
            <script src="files/libs/chartist/dist/chartist.min.js"></script>
            <div class="ct-chart ct-golden-section" id="chart1"></div>

            <script>
              new Chartist.Line('#chart1', {'''
        labels = "labels: ["
        series = "series: ["

        for s in rdata:
            labels+="'"+str(s)+"',"
            series+="["
            for t in rdata[s]:
                series+=str(t)+","
            series=series[:-1]+"],"
        labels=labels[:-1]+"]"
        series=series[:-1]+"]"
        data = "" + labels + ",\n" + series + "\n "
        outputstr+=data
        outputstr += ''' });
        </script>
          </body>
        </html>
        '''

        return webserver.views.TextView.TextView (outputstr)


    def generateDistribution (self,params):
        rdata = {}
        if "solver" in params:
            solvers = params["solver"]
        else:
            solvers = self._result.getSolvers ()
        
        for solv in solvers:
            smtcalls,timeouted,satis,unk,nsatis,time,total = self._result.getSummaryForSolver (solv)
            
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

            



