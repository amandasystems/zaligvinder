import storage.sqlitedb
import webserver.app
import webserver.views.jsonview
import webserver.controllers
import webserver.controllers.dbpText

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
        self._fcontroller = webserver.controllers.FileControl ()
        #self._ccontrollerJS = webserver.controllers.ChartControllerJS (self._results)
        self._ccontrollerJS = webserver.controllers.dbpText.DBPTest (self._results)


        
        app = webserver.app.App ()
        app.addEndpoint (webserver.routing.RegexMatch("files/(?P<path>.+)"),self._fcontroller.findFile)
        app.addEndpoint (webserver.routing.ExactMatch("solvers"),self._rcontroller.getSolvers)
        app.addEndpoint (webserver.routing.ExactMatch("tracks"),self._tcontroller.getAllTracks)
        app.addEndpoint (webserver.routing.ExactMatch("tracks/ids"),self._tcontroller.getAllTrackIds)
        app.addEndpoint (webserver.routing.ExactMatch("tracks/groups"),self._tcontroller.getAllGroups)
        app.addEndpoint (webserver.routing.ExactMatch("tracks/info"),self._rcontroller.getTrackInfo)
        app.addEndpoint (webserver.routing.ExactMatch("instances"),self._icontroller.getAllInstances)
        app.addEndpoint (webserver.routing.RegexMatch("instances/ids/track/(?P<track>\d+)"),self._rcontroller.getInstanceIdsForTrack)
        app.addEndpoint (webserver.routing.RegexMatch("instances/ids/group/(?P<bgroup>[^/]+)"),self._rcontroller.getInstanceIdsForGroup)
        app.addEndpoint (webserver.routing.RegexMatch("instances/solvers/(?P<instance>\d+)"),self._rcontroller.getResultForSolvers)
        app.addEndpoint (webserver.routing.RegexMatch("instances/(?P<instance>\d+)/model.smt"),self._icontroller.getInstanceModel)
        app.addEndpoint (webserver.routing.ExactMatch("results"),self._rcontroller.getAllResults)
        app.addEndpoint (webserver.routing.RegexMatch("results/(?P<track>\d+)"),self._rcontroller.getTrackResults)
        app.addEndpoint (webserver.routing.RegexMatch("results/reference/(?P<instance>\d+)"),self._rcontroller.getReferenceResult)
        app.addEndpoint (webserver.routing.RegexMatch("results/(?P<solver>[^/]+)/(?P<instance>\d+)/output"),self._rcontroller.getOutput)
        app.addEndpoint (webserver.routing.RegexMatch("results/(?P<solver>[^/]+)/(?P<instance>\d+)/model"),self._rcontroller.getModel)
        app.addEndpoint (webserver.routing.RegexMatch("summary/(?P<solver>[^/]+)"),self._rcontroller.getSummaryForSolver)
        app.addEndpoint (webserver.routing.RegexMatch("summary/(?P<solver>[^/]+)/(?P<track>\d+)"),self._rcontroller.getSummaryForSolverTrack)
        app.addEndpoint (webserver.routing.ExactMatch("chart/cactus"),self._ccontroller.generateCactus)
        app.addEndpoint (webserver.routing.RegexMatch("chart/distribution/(?P<track>\d+)"),self._ccontroller.generateTrackDistribution)
        
        app.addEndpoint (webserver.routing.RegexMatch("ranks/(?P<track>\d+)"),self._rcontroller.getRanks)
        #app.addEndpoint (webserver.routing.RegexMatch("jschart/cactus"),self._ccontrollerJS.generateCactus)
        #app.addEndpoint (webserver.routing.RegexMatch("jschart/allcactus"),self._ccontrollerJS.generateCactusAllTracks)
        #app.addEndpoint (webserver.routing.RegexMatch("jschart/distribution"),self._ccontrollerJS.generateDistribution)  
        #app.addEndpoint (webserver.routing.RegexMatch("jschart/pie"),self._ccontrollerJS.generatePie)

        app.addEndpoint (webserver.routing.RegexMatch("comparison"),self._ccontrollerJS.cdl_comparison)
        app.addEndpoint (webserver.routing.RegexMatch(""),self._ccontrollerJS.cdl_test)
        app.addEndpoint (webserver.routing.RegexMatch("becnhmarks"),self._ccontrollerJS.cdl_test)

        


        self._app = app

    def startServer (self):
        self._app.run ()


if __name__ == "__main__":
    import sys
    db = storage.sqlitedb.DB (sys.argv[1])
    Server (db).startServer()
