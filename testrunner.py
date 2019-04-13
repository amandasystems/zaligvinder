#!/usr/bin/python3
import os
import sys


def progressMessage (track,file,solver,cur,total):
    sys.stdout.write ("\x1b[2K\r[ {0}  {1} {2} - {3}/{4}]".format(track,file,solver,cur+1,total))
        
    
def runTrack (dir,solvers,outputfile,timeout):
    results = {}
    for root,dirs,files in os.walk (dir):
        for i,name in enumerate(files):
            if name.endswith (".eq"):  
                for n,func in solvers.items():
                    progressMessage (root,name,n,i,len(files))
                    res, time,timeouted = func (os.path.join (root,name),timeout)
                    outputfile.write ("{0},{1},{2},{3},{4}\n".format (os.path.join (root,name),n,res,time,timeouted))
                    outputfile.flush ()
                    results[n] = results.get(n,[]) + [(res,time,timeouted)]
    sys.stdout.write ("\n")
    return results

def runTestSetup (tracks,solvers,summaries,outputfile,timeout):
    for t in tracks:
        track = t.replace("/","")
        res = runTrack (track,solvers,outputfile,timeout)
        for s in summaries:
            s(track,res)


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

    
    outputfile = open("res.cvs",'w')
    runTestSetup (sys.argv[1:],solvers,summaries,outputfile,timeout)
