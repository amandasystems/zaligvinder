#!/usr/bin/python3
import os
import sys
import utils
from multiprocessing import Pool
from multiprocessing import current_process

cores = 1

def progressMessage (file,solver):
    sys.stdout.write ("\x1b[2K[ {0} -  {1} | {2} ]\r".format(file.name,solver,current_process().pid))

def runSpecific (tup):
    solvername,func,model,timeout = tup
    progressMessage (model,solvername)
    res,time,timeouted,smtcalls = func(model.filepath,timeout)
    tores = (solvername,utils.Result(res,time,timeouted,smtcalls))
    tofile = (model,solvername,res,time,timeouted,smtcalls)
    return tores,tofile

def runTrack (track,solvers,store,timeout):
    results = {}
    tname, files =track.name,track.instances

    todispatch = []
    tasks = []
    for solver,func in solvers.items():
        for i,n in enumerate(files):
            tasks.append ((solver,func,n,timeout))
    p = Pool (cores)
    res = p.map (runSpecific,tasks)

    
    for tores,tofile in res:
        store.writeData (track,tofile[0],tofile[1],tores[1])
        results[tores[0]] = results.get(tores[0],[]) + [tores[1]]
    sys.stdout.write ("\n")
    return results

def runTestSetup (tracks,solvers,summaries,outputfile,timeout):
    for t in tracks:
        res = runTrack (t,solvers,outputfile,timeout)
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
