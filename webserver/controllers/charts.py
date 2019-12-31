import webserver.views.jsonview
import webserver.views.PNGView


class ChartController:
    def __init__(self,result):
        self._result = result

    def generateCactus(self,params):
        rdata = {}
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
        if "png" not in params:
            return webserver.views.jsonview.JSONView (rdata)
        else:
            from matplotlib.figure import Figure
            from io import BytesIO
            fig = Figure()
            ax = fig.subplots()
            ax.plot([1, 2])
            for p in rdata.keys():
                data = [i["y"] for i in rdata[p]]
                ax.scatter (range(0,len(data)),data,label = p)
                # Save it to a temporary buffer.
            buf = BytesIO()
            fig.savefig(buf, format="png")
            return webserver.views.PNGView.PNGView (buf)
