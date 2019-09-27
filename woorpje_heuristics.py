import sys
import subprocess
import shutil
import timer
import utils
import subprocess

tool = utils.findProgram ("WOORPJESMTBINARY","woorpjeSMT")

def run (eqfile,timeout,heuristicNo,smtSolverNo,heuristic_param_name,param):
    if tool:
        SMTSolverCalls = 0
        try:
            time = timer.Timer ()
            #p = subprocess.check_output ([tool, '--solver', '4' ,'-S',str(smtSolverNo),'--smttimeout', '10', '--levisheuristics',str(heuristicNo),str(heuristic_param_name),str(param), eqfile],timeout=timeout)
            #out = subprocess.check_output ([tool,'--simplify', eqfile],timeout=timeout)


            p = subprocess.run([tool, '--solver', '4' ,'-S',str(smtSolverNo),'--smttimeout', '10', '--levisheuristics',str(heuristicNo),str(heuristic_param_name),str(param), eqfile],  stdout=subprocess.PIPE, encoding='ascii', universal_newlines = True,timeout=timeout)
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

if __name__ == "__main__":
    run (sys.argv[1],None)