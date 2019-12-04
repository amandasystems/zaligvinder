import woorpje2smt
import subprocess
import tempfile
import os
import shutil
import utils
import sys
import timer


path = utils.findProgram ("Z3BINARY","z3")

def run (eq,timeout):
    if not path:
        raise "Z3 Not in Path"

    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    woorpje2smt.run (eq,smtfile)

    time = timer.Timer ()
    try:
        out = subprocess.check_output ([path,"smt.string_solver=z3str3","dump_models=true","model_validate=true",smtfile],timeout=timeout).decode().strip()
    except subprocess.TimeoutExpired:
        return None,timeout,True,1
    except subprocess.CalledProcessError:
        return None,timeout,False,1

    time.stop()
    shutil.rmtree (tempd)
    if "unsat" in out:
        return False,time.getTime (),False,1
    elif "sat" in out:
        return True,time.getTime(),False,1
    return None,time.getTime  (),False,1

if __name__ == "__main__":
    print(run (sys.argv[1],None))

