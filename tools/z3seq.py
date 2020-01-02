import tools.woorpje2smt
import subprocess
import tempfile
import utils
import shutil
import os
import sys
import timer

#path = utils.findProgram ("Z3BINARY","z3")

def run (eq,timeout,solver="1",param="60"):
    path = ploc.findProgram ("Z3")
    if not path:
        raise "Z3 Not in Path"

    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    tools.woorpje2smt.run (eq,smtfile)
    time = timer.Timer ()
    try:
        out = subprocess.check_output ([path,"smt.string_solver=seq",smtfile],timeout=timeout).decode().strip()
    except subprocess.TimeoutExpired:
        return None,timeout,True,1
    except subprocess.CalledProcessError:
        return None,timeout,False,1
    time.stop ()
    shutil.rmtree (tempd)
    if "unsat" in out:
        return False,time.getTime (),False,1
    elif "sat" in out:
        return True,time.getTime(),False,1
    return None,time.getTime  (),False,1

def addRunner (addto):
    addto['z3seq3'] = run


if __name__ == "__main__":
    print(run (sys.argv[1],None))

