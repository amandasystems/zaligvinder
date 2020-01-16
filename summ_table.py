import sys
import io

class TableGenerator:
    def __init__(self,result,track,solvers =  None):
        self._res = result
        self._track  = track
        self._solvers = solvers or self._res.getSolvers ()
        self._output = io.StringIO ()
        
    def genTableHeader (self):
        self._output.write ("\\begin{{tabular}}{{*{{{}}}{{c}}}}\n".format(1+len(self._solvers)*3))
        
        res = ["\multicolumn{{3}}{{c}}{{{}}}".format (s) for s in self._solvers]
        self._output.write ("&"+"&".join (res))
        self._output.write ("\\\\ \n")
        res = ["\\faCheck & \\faBomb & \\faClockO".format (s) for s in self._solvers]
        self._output.write (" & "+"&".join (res) + " \\\\" )
        
    def getData (self):
        groups = list(self._track.getAllGroups ())
        print (groups)
        for g in groups:
            lines = []
            for s in self._solvers:
                res = self._res.getSummaryForSolverGroup (s,g)
                lines.append ("{} & {} & {}".format(res[2],res[4],res[6]))
            self._output.write (g)
            self._output.write ("&"+"&".join (lines))
            
    def genTableFooter (self):
        self._output.write ("\\end{tabular}")
    
    def generateTable (self):
        self.genTableHeader ()
        self.getData ()
        self.genTableFooter ()
        print (self._output.getvalue ())
    
if __name__ == "__main__":
    import sys
    import storage.sqlitedb
    db = storage.sqlitedb.DB (sys.argv[1])
    _trackinstance = storage.sqlitedb.TrackInstanceRepository (db)
    _track = storage.sqlitedb.TrackRepository(db,_trackinstance)
    _results = storage.sqlitedb.ResultRepository (db,_track,_trackinstance)
    table  = TableGenerator (_results,_track)
    table.generateTable ()
    
