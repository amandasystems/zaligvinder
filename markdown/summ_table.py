import sys
import io

class TableGenerator:
    def __init__(self,result,track,solvers =  None,groups = None):
        self._res = result
        self._track  = track
        self._solvers = solvers or self._res.getSolvers ()
        self._groups = groups or [tup[0] for tup in list(self._track.getAllGroups ())]

        ## quick hack
        #self._groupTracks = self._res.getTrackInfo( )



    def getData (self):
        groups = self._groups
        #print (groups)
        
        totalSumData = dict()

        for i,g in enumerate(groups):
            self._output.write ("=== "+g+"\n")
            #for (tid,tname) in self._groupTracks[g]:
            #totalSumData = dict()
            lines = []
            #self._output.write ("=== "+tname+"\n")
        
            for s in self._solvers:
                if s not in totalSumData:
                    totalSumData[s] = [0,0,0]

                (smtcalls,timeouted,satis,unk,nsatis,errors,time,total,timeWO,totalWO) = self._res.getSummaryForSolverGroupTotalTimeWOTimeout (s,g)
                print(g,s,timeWO,totalWO)

                #(smtcalls,timeouted,satis,unk,nsatis,errors,time,total) = self._res.getSummaryForSolverTrack (s,tid)
                lines.append ("|{}|{}|{}|{}|{}|{}|{}|{:.2f}|{}|{:.2f}\n".format(s,satis,nsatis,unk,errors,timeouted,total,time,totalWO,timeWO))


                classified = satis + nsatis -errors
                totalSumData[s][0]+=classified
                totalSumData[s][1]+=time
                totalSumData[s][2]+=timeWO

            #self._output.write ("=== "+g+"\n")

            self._output.write ('''\n\n[.text-center]
image::img/'''+g.lower().split(" ", 1)[0]+'''.png[cactus]\n\n''')

            self._output.write ('''|===\n|Tool name |Declared satisfiable |Declared unsatisfiable |Declared unknown |Error |Timeout |Total instances |Total time|Total instances w/o TO |Total time w/o TO\n''')
            self._output.write ("".join (lines))
            self._output.write ("|===\n\n")


        # overview Data
        lines = []
        self._output.write("\n\n=== Total\n")

        for s in totalSumData:
            lines.append ("|{}|{}|{:.2f}|{:.2f}\n".format(s,totalSumData[s][0],totalSumData[s][1],totalSumData[s][2]))

        self._output.write ('''|===\n|Tool name |Correctly classified |Total time| Total time w/o TO\n''')
        self._output.write ("".join (lines))
        self._output.write ("|===\n\n")

    
    def generateTable (self,output):
        self._output = output
        self.getData ()
        
if __name__ == "__main__":
    import sys
    import storage.sqlitedb
    db = storage.sqlitedb.DB (sys.argv[1])
    _trackinstance = storage.sqlitedb.TrackInstanceRepository (db)
    _track = storage.sqlitedb.TrackRepository(db,_trackinstance)
    _results = storage.sqlitedb.ResultRepository (db,_track,_trackinstance)
    table  = TableGenerator (_results,_track)
    table.generateTable ()
    



'''
|===
|Program |Satis | NSatis | Error | Unknown | Timeout | Total | Time | TimeWO
|woorpje|200|0|0|0|0|200|8.10|8.10
|cvc4|182|0|0|0|18|200|543.32|3.32
|z3str3|197|0|0|1|2|200|105.07|45.07
|z3seq|183|0|0|0|17|200|545.24|35.24
|norn|176|4|4|0|20|200|1037.63|437.63
|sloth|101|0|0|0|99|200|3658.34|688.34
|===
'''


'''
<link rel="stylesheet" type="text/css" href="ascii.css">
<link rel="stylesheet" type="text/css" href="css.css">
'''