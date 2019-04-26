import woorpje2smt
import subprocess
import tempfile
import os
import shutil
import sys
import timer
import utils

#path = shutil.which ("cvc4")
path = utils.findProgram ("CVC4BINARY","cvc4")


def run (eq,timeout):
    if not path:
        raise "Z3 Not in Path"

    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    woorpje2smt.run (eq,smtfile)
    time = timer.Timer ()
    try:
        out = subprocess.check_output ([path,"--lang","smt","-m","--strings-exp",smtfile],timeout=timeout).decode().strip()
    except subprocess.TimeoutExpired:
        return None,timeout,True
    except subprocess.CalledProcessError:
        return None,timeout,False
    time.stop ()
    shutil.rmtree (tempd) 
    if out == "sat":
        return True, time.getTime(),False
    elif out  =="unsat":
        return False, time.getTime(),False
    return None,time.getTime(),False

if __name__ == "__main__":
    print(run (sys.argv[1],None))

