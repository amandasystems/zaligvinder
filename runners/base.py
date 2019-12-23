#!/usr/bin/python3
import os
import sys
import utils

def progressMessage (track,file,solver,cur,total):
    sys.stdout.write ("\x1b[2K\r[ {0}  {1} {2} - {3}/{4}]".format(track,file,solver,cur+1,total))


def runTrack (track,solvers,outputfile,timeout):
    results = {}
    tname, files = track.name, track.instances
    print ("Running track {0} with {1} files.".format (tname,len(files)))
    
    for solver,func in solvers.items():
        for i,n in enumerate(files):
            progressMessage (tname,n.name,solver,i,len(files))
            res, time,timeouted,smtcalls = func (n.filepath,timeout)
            outputfile.write ("{0},{1},{2},{3},{4},{5}\n".format (n,solver,res,time,timeouted,smtcalls))
            outputfile.flush ()
            results[solver] = results.get(solver,[]) + [utils.Result(res,time,timeouted,smtcalls)]
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
