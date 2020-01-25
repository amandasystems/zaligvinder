#!/usr/bin/python3
import os
import sys
import utils
import tempfile
import shutil

from multiprocessing import Pool
from multiprocessing import current_process

def progressMessage (file,solver):
    sys.stdout.write ("\x1b[2K[ {0} -  {1} | {2} ]\r".format(file.name,solver,current_process().pid))

def runSpecific (tup):
    try:
        solvername,func,model,timeout,ploc = tup
        progressMessage (model,solvername)
        tempd = tempfile.mkdtemp ()
        result = func(model.filepath,timeout,ploc,tempd)
        shutil.rmtree (tempd)    
        return result
    except Exception as e:
        print (str(e))
        shutil.rmtree (tempd)
        return utils.Result(None,timeout,True,0,str(e))
    
class TheRunner:
    def __init__(self,cores = 60):
        self._cores = cores
        
    def runTrack (self,track,solvers,store,timeout,ploc):
        print (track)
        results = {}
        tname, files =track.name,track.instances
        
        todispatch = []
        tasks = []
        for solver,func in solvers.items():
            for i,n in enumerate(files):
                tasks.append ((solver,func,n,timeout,ploc))
        with Pool (self._cores) as p:
            res = p.map (runSpecific,tasks)
        
        
    
        for setting,result in zip (tasks,res):
            solvername,model = setting[0],setting[2]
            store.writeData (track,model,solvername,result)
            results[solvername] = results.get(solvername,[]) + [result]
        sys.stdout.write ("\n")
        
        return results

    def runTestSetup (self,tracks,solvers,voter,summaries,outputfile,timeout,ploc):
        for t in tracks:
            res = self.runTrack (t,solvers,outputfile,timeout,ploc)
            voter.voteOnResult (t,res)
            for s in summaries:
                s(t,res)


if __name__ == "__main__":
    import z3seq
    import z3str3
    import cvc4
    import woorpje
    import summarygenerators

    timeout = 30

    solvers = {'z3str3' : z3str3.run,
           'z3seq' : z3seq.run,
           'cvc4' : cvc4.run,
           'woorpje' :  woorpje.run
    }

    summaries = [summarygenerators.terminalResult,
                 summarygenerators.cactusPlot
    ]

    print("LOL")


    outputfile = open("res.cvs",'w')
    runTestSetup (sys.argv[1:],solvers,summaries,outputfile,timeout)
