import webserver.views.charts.base
import webserver.files

class DBPTest:
    def __init__(self,result):
        self._result = result
        
    def cdl_test (self,params):
        data = self._result.getTrackInfo ()
        benchmarks = data.keys()
        if "bgroup" in params:
            activeGroup = params["bgroup"][0]
        else:
            activeGroup = list(data.keys())[0]

        tracks = data[activeGroup]
        ctrack = int(params.get("track",[1])[0])
        trackname = "UNKNOWN"
        for tid,name in data[activeGroup]:
            print (tid,ctrack)
            if tid == ctrack:
                trackname = name
                break
        return webserver.views.charts.base.BenchmarkTrackView (
            [(n,"/?bgroup={}".format(n)) for n in benchmarks],
             [(tup[1],"/?bgroup={}&track={}".format(activeGroup,tup[0])) for tup in tracks],
             activeGroup,
             trackname,
             ctrack
        )
            
