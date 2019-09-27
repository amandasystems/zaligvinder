#!/usr/bin/python3
import os
import sys


def progressMessage (track,file,solver,cur,total):
    sys.stdout.write ("\x1b[2K\r[ {0}  {1} {2} - {3}/{4}]".format(track,file,solver,cur+1,total))


def runTrack (dir,solvers,outputfile,timeout):
    results = {}

    # quick hack to get the heuristic stuff running
    # SMT Solversetup
    smtSolvers = dict()
    smtSolvers[0] = "CVC4"
    #smtSolvers[1] = "z3seq"
    smtSolvers[2] = "z3str3"

    # heuristic setup
    heuristics = dict()

    heuristics[0] = ('VariableTerminalRatio','--VarTerminalRation',[3.14,0.15,1.12358])
    heuristics[1] = ('WaitingListLimitReached','--WaitingLimit',[314,15,1123])
    heuristics[2] = ('EquationGrowth','--growth',[0.15,1.075,2])
    heuristics[3] = ('EquationLengthExceeded','--eqLength',[2,20,400])
    heuristics[0] = ('NoSMT','--VarTerminalRation',[0])

    for root,dirs,files in os.walk (dir):
        for i,name in enumerate(files):
            if name.endswith (".smt2"):
                for n,func in solvers.items():
                    if not n.startswith("heuristic"):
                        progressMessage (root,name,n,i,len(files))
                        res, time,timeouted = func (os.path.join (root,name),timeout)
                        outputfile.write ("{0},{1},{2},{3},{4},0\n".format (os.path.join (root,name),n,res,time,timeouted))
                        outputfile.flush ()
                        results[n] = results.get(n,[]) + [(res,time,timeouted,0)]
                    else:
                        for j in smtSolvers.keys():
                            for h in heuristics:
                                heuristic_param_name = heuristics[h][1]
                                heuristic_name = heuristics[h][0]
                                for param in heuristics[h][2]:
                                    progressMessage (root,name,heuristic_name+" with "+smtSolvers[j]+" and parameter " + str(param),i,len(files))
                                    res, time,timeouted,smtSolverCalls = func (os.path.join (root,name),timeout,h,str(j),heuristic_param_name,str(param))
                                    outputfile.write ("{0},{1},{2},{3},{4},{5}\n".format (os.path.join (root,name),heuristic_name+"-"+smtSolvers[j]+"-"+str(param),res,time,timeouted,smtSolverCalls))
                                    outputfile.flush ()
                                    results[heuristic_name+"-"+smtSolvers[j]+"-"+str(param)] = results.get(heuristic_name+"-"+smtSolvers[j]+"-"+str(param),[]) + [(res,time,timeouted,smtSolverCalls)]
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

    print("LOL")


    outputfile = open("res.cvs",'w')
    runTestSetup (sys.argv[1:],solvers,summaries,outputfile,timeout)
