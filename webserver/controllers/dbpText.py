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

        #tracks = data[activeGroup]
        ctrack = int(params.get("track",[1])[0])
        trackname = None
        for tid,name in data[activeGroup]:
            print (tid,ctrack)
            if tid == ctrack:
                trackname = name
                break

        tracksmap = dict()
        for bgroup in data:
            if bgroup not in tracksmap: 
                tracksmap[bgroup] = []
                tracksmap[bgroup] = [(tup[1],"/?bgroup={}&track={}".format(bgroup,tup[0])) for tup in data[bgroup]]

        return webserver.views.charts.base.BenchmarkTrackView (
            [(n,"/?bgroup={}".format(n)) for n in benchmarks],
             tracksmap,
             activeGroup,
             trackname,
             ctrack
        )
            
