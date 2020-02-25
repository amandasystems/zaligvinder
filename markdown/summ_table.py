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
            best = dict()
            self._output.write ("=== "+g+"\n")
            #for (tid,tname) in self._groupTracks[g]:
            #totalSumData = dict()
            lines = []
            #self._output.write ("=== "+tname+"\n")
        
            for s in self._solvers:
                if s not in totalSumData:
                    totalSumData[s] = [0]*10

                (smtcalls,timeouted,satis,unk,nsatis,errors,time,total,timeWO,totalWO) = self._res.getSummaryForSolverGroupTotalTimeWOTimeout (s,g)
                print(g,s,timeWO,totalWO)

                #(smtcalls,timeouted,satis,unk,nsatis,errors,time,total) = self._res.getSummaryForSolverTrack (s,tid)
                lines.append ("|{}|{}|{}|{}|{}|{}|{}|{:.2f}|{}|{:.2f}\n".format(s,satis,nsatis,unk,errors,timeouted,total,time,totalWO,timeWO))

                #correctly,satis,nsatis,unk,errors,timeouted,total,time,totalWO,timeWO
                classified = satis + nsatis -errors
                totalSumData[s][0]+=classified
                totalSumData[s][1]+=satis
                totalSumData[s][2]+=nsatis
                totalSumData[s][3]+=unk
                totalSumData[s][4]+=errors
                totalSumData[s][5]+=timeouted
                totalSumData[s][6]+=total
                totalSumData[s][7]+=time
                totalSumData[s][8]+=totalWO
                totalSumData[s][9]+=timeWO

                best[s] = [classified,time,timeWO]

            #self._output.write ("=== "+g+"\n")

            self._output.write ('''\n\n[.text-center]
image::img/'''+g.lower().replace(" ", "")+'''.png[cactus]\n\n''')

            self._output.write ('''\n\n[.text-center]
image::img/keys/'''+g.lower().replace(" ", "")+'''.png[keywords]\n\n''')

            self._output.write ('''|===\n|Tool name |Declared satisfiable |Declared unsatisfiable |Declared unknown |Error |Timeout |Total instances |Total time|Total instances w/o TO |Total time w/o TO\n''')
            self._output.write ("".join (lines))
            self._output.write ("|===\n\n")

            # Best solver of the group
            current = []
            for s in best:
                if len(current) == 0:
                    current = best[s]+[s]
                elif current[0]/current[1] <= best[s][0]/best[s][1]:
                    current = best[s]+[s]

            self._output.write('''[NOTE]
====
Best solver of this benchmark set '''+str(current[3])+''' classified '''+str(current[0])+''' instances in '''+str(current[1])+'''s.
==== \n\n''')


        # overview Data
        lines = []
        self._output.write("\n\n=== Total\n")

        for s in totalSumData:
            (correctly,satis,nsatis,unk,errors,timeouted,total,time,totalWO,timeWO) = totalSumData[s]
            lines.append ("|{}|{}|{}|{}|{}|{}|{}|{}|{:.2f}|{}|{:.2f}\n".format(s,correctly,satis,nsatis,unk,errors,timeouted,total,time,totalWO,timeWO))
            #lines.append ("|{}|{}|{:.2f}|{:.2f}\n".format(s,totalSumData[s][0],totalSumData[s][1],totalSumData[s][2]))

        #self._output.write ('''|===\n|Tool name |Correctly classified |Total time| Total time w/o TO\n''')
        self._output.write ('''|===\n|Tool name |Correctly classified |Declared satisfiable |Declared unsatisfiable |Declared unknown |Error |Timeout |Total instances |Total time|Total instances w/o TO |Total time w/o TO\n''')
        self._output.write ("".join (lines))
        self._output.write ("|===\n\n")


    def getDataX (self):
        groups = self._groups
        self._groupTracks = self._res.getTrackInfo( )
        #print (groups)
        
        totalSumData = dict()

        for i,g in enumerate(groups):
            self._output.write ("=== "+g+"\n")
            for (tid,tname) in self._groupTracks[g]:
                best = dict()
                lines = []
                self._output.write ("==== "+tname+"\n")
        
                for s in self._solvers:
                    if s not in totalSumData:
                        totalSumData[s] = [0,0,0]

                    (smtcalls,timeouted,satis,unk,nsatis,errors,time,total,timeWO,totalWO) = self._res.getSummaryForSolverTrackTotalTimeWOTimeout (s,tid)
                    lines.append ("|{}|{}|{}|{}|{}|{}|{}|{:.2f}|{}|{:.2f}\n".format(s,satis,nsatis,unk,errors,timeouted,total,time,totalWO,timeWO))


                    classified = satis + nsatis -errors
                    totalSumData[s][0]+=classified
                    totalSumData[s][1]+=time
                    totalSumData[s][2]+=timeWO
                    best[s] = [classified,time,timeWO]

            #self._output.write ("=== "+g+"\n")

                self._output.write ('''\n\n[.text-center]
image::img/'''+g.lower().replace(" ", "")+'''/'''+tname.lower().replace(" ", "")+'''.png[cactus]\n\n''')

                self._output.write ('''|===\n|Tool name |Declared satisfiable |Declared unsatisfiable |Declared unknown |Error |Timeout |Total instances |Total time|Total instances w/o TO |Total time w/o TO\n''')
                self._output.write ("".join (lines))
                self._output.write ("|===\n\n")

                # Instances Details for track
                instances = self._res.getInstanceIdsForTrack(tid)
                instanceData = dict()
                keywords = ["Int","String"]

                for iid in instances:
                    newInstanceData = self._res.instanceInformation(iid)
                    for k in newInstanceData:
                        if k not in instanceData:
                            instanceData[k] = 0
                        instanceData[k]+=newInstanceData[k]

                average_length = int(instanceData["length"] / len(instances))
                total_variables = sum([instanceData[k] for k in keywords])
                variable_data = dict()
                for k in keywords:
                    variable_data[k] = (instanceData[k],instanceData[k]/total_variables)

                self._output.write ('''|===\n|Average length |Total variables |Average variables |Total Int variables | Int variable ratio |Total string variables |String variable ratio\n''')
                self._output.write ("|{}|{}|{:.2f}|{}|{:.2f}|{}|{:.2f}\n".format(average_length,total_variables,total_variables/len(instances),variable_data["Int"][0],variable_data["Int"][1],variable_data["String"][0],variable_data["String"][1]))
                self._output.write ("|===\n\n")

                # Best solver of the track
                current = []
                for s in best:
                    if len(current) == 0:
                        current = best[s]+[s]
                    elif current[0]/current[1] <= best[s][0]/best[s][1]:
                        current = best[s]+[s]

                self._output.write('''[NOTE]
====
Best solver of this track '''+str(current[3])+''' classified '''+str(current[0])+''' instances in '''+str(current[1])+'''s.
==== \n\n''')


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