import storage.sqlitedb
import webserver.app
import webserver.views.jsonview
import webserver.controllers


class Server:
    def __init__ (self,db):
        self._db = db
        self._trackinstance = storage.sqlitedb.TrackInstanceRepository (db)
        self._track = storage.sqlitedb.TrackRepository(db,self._trackinstance)
        self._results = storage.sqlitedb.ResultRepository (db,self._track,self._trackinstance)
        self._tcontroller = webserver.controllers.TracksController (self._track)
        self._icontroller = webserver.controllers.TrackInstanceController (self._trackinstance)
        self._rcontroller = webserver.controllers.ResultController (self._results)
        self._ccontroller = webserver.controllers.ChartController (self._results)

        app = webserver.app.App ()
        app.addEndpoint (webserver.routing.ExactMatch("solvers"),self._rcontroller.getSolvers)
        app.addEndpoint (webserver.routing.ExactMatch("tracks"),self._tcontroller.getAllTracks)
        app.addEndpoint (webserver.routing.ExactMatch("instances"),self._icontroller.getAllInstances)
        app.addEndpoint (webserver.routing.RegexMatch("instances/(?P<instance>\d+)/model.smt"),self._icontroller.getInstanceModel)
        app.addEndpoint (webserver.routing.ExactMatch("results"),self._rcontroller.getAllResults)
        app.addEndpoint (webserver.routing.RegexMatch("results/(?P<track>\d+)"),self._rcontroller.getTrackResults)
        app.addEndpoint (webserver.routing.RegexMatch("results/reference/(?P<instance>\d+)"),self._rcontroller.getReferenceResult)
        
        app.addEndpoint (webserver.routing.RegexMatch("results/(?P<solver>[^/]+)/(?P<instance>\d+)/output"),self._rcontroller.getOutput)
        app.addEndpoint (webserver.routing.RegexMatch("summary/(?P<solver>[^/]+)"),self._rcontroller.getSummaryForSolver)
        app.addEndpoint (webserver.routing.RegexMatch("summary/(?P<solver>[^/]+)/(?P<track>\d+)"),self._rcontroller.getSummaryForSolverTrack)
        app.addEndpoint (webserver.routing.ExactMatch("chart/cactus"),self._ccontroller.generateCactus)
        app.addEndpoint (webserver.routing.ExactMatch("chart/distribution"),self._ccontroller.generateDistribution)
        self._app = app

    def startServer (self):
        self._app.run ()


if __name__ == "__main__":
    import sys
    db = storage.sqlitedb.DB (sys.argv[1])
    Server (db).startServer()
