import subprocess
import tempfile
import os
import shutil
import utils
import sys
import timer
def run (params,eq,timeout,ploc,wd):
    path = ploc.findProgram ("woorpjeSMT")
    if not path:
        raise "WoorpjeSMT Not in Path"

    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    time = timer.Timer ()
    myerror = ""
    try:
            smtmodel = os.path.join (wd,"smtmodel.smt")
            time = timer.Timer ()
            out = subprocess.check_output ([path, '--smtmodel',smtmodel,'--smttimeout', '15','--solver','4']+params+[eq],timeout=timeout)
            time.stop ()
            with open(smtmodel) as f:
                    model = f.read()
                    return utils.Result(True,time.getTime(),False,0,out,model)

    except subprocess.CalledProcessError as ex:
            time.stop ()
            #if ex.returncode == 0:
            #    extractFile(eqfile,sfile)
            if ex.returncode == 10 or ex.returncode == 20:
                return utils.Result(None,time.getTime (),False,0,ex.output)
            elif ex.returncode == 1:
                return utils.Result(False,time.getTime (),False,0,ex.output)
            elif ex.returncode == 134 or ex.returncode == 255:
                return utils.Result(None,0,False,0,ex.output)
            else:
                return utils.Result(None,time.getTime (),False,0,ex.output)
    except subprocess.TimeoutExpired:
            #extractFile(eqfile,sfile)
            return utils.Result(None,timeout,True,0)

def addRunner (addto):
    from functools import partial

    solvers = { "z3seq" : 0, "cvc4" : 1, "z3str3" : 2}
    heuristics = { "VTR" : "VarTerminalRation", # VariableTerminalRatio
                   "WLR" :  "WaitingLimit",   # WaitingListLimitReached
                   "EG" :  "growth",                   # EquationGrowth
                   "ELE" :  "eqLength",        # EquationLengthExceeded
                   "N" : "" }                                  # None
    values = [[3.14,0.15,1.12358],[314,15,1123],[0.15,1.075,2],[2,20,400],[]]

    paramList = []

    for i,h in enumerate(heuristics):       # heuristic name
        for s in solvers:                   # assisting solver
            p = heuristics[h]          # paramter for heuristic

            if len(values[i]) == 0:
                paramList = ["-S",str(solvers[s])] + ["--levisheuristics",str(i)]
                solverName = 'woorpje-'+str(s)+'-'+str(h)
                addto[solverName] = partial(run,paramList)
            else:    
                for v in values[i]:         # values for parameter
                    paramList = ["-S",str(solvers[s])] + ["--levisheuristics",str(i)] + ["--"+str(p), str(v)]
                    solverName = 'woorpje-'+str(s)+'-'+str(h)+"-"+str(v)
                    addto[solverName] = partial(run,paramList)



if __name__ == "__main__":
    print(run (sys.argv[1],None))



