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
    tools.woorpje2smt.run (eq,smtfile,ploc)
    time = timer.Timer ()
    try:
        out = subprocess.check_output ([path,"smt.string_solver=seq",smtfile],timeout=timeout).decode().strip()
    except subprocess.TimeoutExpired:
        return utils.Result(None,timeout,True,1)
    except subprocess.CalledProcessError:
        return utils.Result(None,timeout,False,1)
    time.stop ()
    shutil.rmtree (tempd)
    if "unsat" in out:
        return utils.Result(False,time.getTime (),False,1,out)
    elif "sat" in out:
        return utils.Result(True,time.getTime(),False,1,out,"\n".join(out.split("\n")[1:]))
    return utils.Result(None,time.getTime  (),False,1,out)

def addRunner (addto):
    addto['z3seq3'] = run


if __name__ == "__main__":
    print(run (sys.argv[1],None))

