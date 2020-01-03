#!/usr/bin/python3
import os
import sys
import utils

def progressMessage (track,file,solver,cur,total):
    sys.stdout.write ("\x1b[2K\r[ {0}  {1} {2} - {3}/{4}]".format(track,file,solver,cur+1,total))

class TheRunner:
    def runTrack (self,track,solvers,store,timeout,ploc):
        results = {}
        tname, files = track.name, track.instances
        print ("Running track {0} with {1} files.".format (tname,len(files)))
    
        for solver,func in solvers.items():
            for i,n in enumerate(files):
                progressMessage (tname,n.name,solver,i,len(files))
                result = func (n.filepath,timeout,ploc)
                store.writeData (track,n,solver,result)
                results[solver] = results.get(solver,[]) + [result]
        sys.stdout.write ("\n")
        return results

    def runTestSetup (self,tracks,solvers,summaries,outputfile,timeout,ploc):
        for t in tracks:
            res = self.runTrack (t,solvers,outputfile,timeout,ploc)
            for s in summaries:
                s(t,res)
