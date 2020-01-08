import webserver.views

class TracksController:
    def __init__ (self,track):
        self._track = track

    def getAllTracks (self,params):
        def constr (t):
            data = {"name" : t.name,
                    "id" : t.dbid,
                    "benchmark" : t.benchmark
            }
            trackfiles = []
            for tt  in t.instances:
                trackfiles.append ({"name" : tt.name,
                                    "id" : tt.dbid
                })
            data["instances"] = trackfiles
            return data
        res = self._track.loadAllTracks ()
        result = [constr(t) for t  in res]
        return webserver.views.jsonview.JSONView (result)

