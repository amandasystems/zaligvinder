import sys
import subprocess
import shutil
import timer
import utils
import subprocess

tool = utils.findProgram ("WOORPJESMTBINARY","woorpjeSMT")

def run (eqfile,timeout,heuristicNo,smtSolverNo,heuristic_param_name,param,ploc):
    tool = ploc.findProgram ("woorpjeSMT")

    if tool:
        SMTSolverCalls = 0
        try:
            time = timer.Timer ()
            #p = subprocess.check_output ([tool, '--solver', '4' ,'-S',str(smtSolverNo),'--smttimeout', '10', '--levisheuristics',str(heuristicNo),str(heuristic_param_name),str(param), eqfile],timeout=timeout)
            #out = subprocess.check_output ([tool,'--simplify', eqfile],timeout=timeout)
            
            
            p = subprocess.run([tool, '--solver', '4' ,'-S',str(smtSolverNo),'--smttimeout', '15', '--levisheuristics',str(heuristicNo),str(heuristic_param_name),str(param), eqfile],  stdout=subprocess.PIPE, encoding='ascii', universal_newlines = True,timeout=timeout)
            time.stop ()
            output = p.stdout.splitlines()

            for l in output:
                if l.startswith("SMTCalls:"):
                    SMTSolverCalls = [int(x) for x in l.split(" ") if x.isdigit()][0]


            if p.returncode == 0:
                return True,time.getTime(),False,SMTSolverCalls
            elif p.returncode == 10 or p.returncode == 20:
                return None,time.getTime (),False,SMTSolverCalls
            elif p.returncode == 1:
                return False,time.getTime (),False,SMTSolverCalls
            else:
                return None,time.getTime (),False,SMTSolverCalls
        except Exception as  e:
            time.stop ()
            return None,timeout,True,SMTSolverCalls

    else:
        raise "woorpje Not in Path"

def runVariableTermRatio (eqfile,timeout,solver,ratio,ploc):
    return run (eqfile,timeout,0,solver,"--VarTerminalRation",ratio)

def runWaitingListLimitReached (eqfile,timeout,solver,ratio,ploc):
    return run (eqfile,timeout,1,solver,"--WaitingLimit",ratio)

def runEquationGrowth (eqfile,timeout,solver,ratio,ploc):
    return run (eqfile,timeout,2,solver,"--growth",ratio,ploc)

def runEquationGrowthExceeded (eqfile,timeout,solver,ratio,ploc):
    return run (eqfile,timeout,3,solver,"--eqLength",ratio,ploc)

def runNone (eqfile,timeout,solver,ratio,ploc):
    return run (eqfile,timeout,4,solver,"--VarTerminalRation",0,ploc)


smtsolvers= {"z3seq" : 0,
             "cvc4" : 1,
             "z3str3": 2
}

runName = {
    "variableTermRatio" : runVariableTermRatio,
    "waitingListLimit" : runWaitingListLimitReached,
    "equationGrowth" : runEquationGrowth,
    "equationLength" : runEquationGrowthExceeded,
    "none" : runNone
    }


class RunProxy:
    def __init__ (self,func,smtsolver,param):
        self._func = func
        self._smtsolver = smtsolver
        self._param = param

    def __call__ (self,eq,timeout,ploc):
        return self._func (eq,timeout,smtsolvers[self._smtsolver],self._param,ploc)
            

def makeRunner (func,smtsolver,param):
    return RunProxy (func,smtsolver,param)

def addRunners (runname,solvers,param,addTo):
    for solver in solvers:
        assert(solver in smtsolvers)
        name = "{0}_{1}_{2}".format (runname,param,solver)
        assert(runname in runName)
        addTo[name] = makeRunner (runName[runname],solver,param)

