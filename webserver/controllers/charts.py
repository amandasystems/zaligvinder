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
        for solv in solvers:
            res = self._result.getResultForSolver (solv)
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
        if "format" not in params:
            return webserver.views.jsonview.JSONView (rdata)
        else:
            form = params["format"][0]
            if form == "png":
                from matplotlib.figure import Figure
                from io import BytesIO
                fig = Figure()
                ax = fig.subplots()
                for p in rdata.keys():
                    data = [i["y"] for i in rdata[p]]
                    ax.scatter (range(0,len(data)),data,label = p)
                    ax.legend()
                    # Save it to a temporary buffer.
                    buf = BytesIO()
                    fig.savefig(buf, format="png")
                    return webserver.views.PNGView.PNGView (buf)
            else:
                return webserver.views.TextView.ErrorText ("Unknown format")
                    
