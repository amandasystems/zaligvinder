import sys
import subprocess
import shutil
import timer
import utils

tool = utils.findProgram ("WOORPJEBINARY","woorpje")

def run (eqfile,timeout,heuristicNo,smtSolverNo,heuristic_param_name,param):
    if tool:
        try:
            time = timer.Timer ()
            out = subprocess.check_output ([tool, '--solver', '4' ,'-S',str(smtSolverNo),'--smttimeout', '10', '--levisheuristics',str(heuristicNo),str(heuristic_param_name),str(param), eqfile],timeout=timeout)
            #out = subprocess.check_output ([tool,'--simplify', eqfile],timeout=timeout)
            #print(out.decode().strip())
            time.stop ()
            return True,time.getTime(),False
        except subprocess.CalledProcessError as ex:
            time.stop ()
            if ex.returncode == 10 or ex.returncode == 20:
                return None,time.getTime (),False
            elif ex.returncode == 1:
                return False,time.getTime (),False
            else:
                return None,time.getTime (),False
        except subprocess.TimeoutExpired:
            return None,timeout,True


    else:
        raise "woorpje Not in Path"

if __name__ == "__main__":
    run (sys.argv[1],None)