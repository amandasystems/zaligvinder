import tools.woorpje2smt
import subprocess
import tempfile
import os
import shutil
import sys
import timer
import utils

#path = shutil.which ("cvc4")
#path = utils.findProgram ("CVC4BINARY","cvc4")


def run (eq,timeout,ploc,wd,solver="1",param="60"):
    path = ploc.findProgram ("cvc4")
    if not path:
        raise "Z3 Not in Path"

    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    tools.woorpje2smt.run (eq,smtfile,ploc)

    time = timer.Timer ()
    try:
        out = subprocess.check_output ([path,"--lang","smt","-m","--strings-exp",smtfile],timeout=timeout).decode().strip()
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
    addto['cvc4'] = run


if __name__ == "__main__":
    print(run (sys.argv[1],None))

