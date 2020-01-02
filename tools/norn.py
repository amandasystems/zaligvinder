import woorpje2smt
import subprocess
import tempfile
import os
import shutil
import utils
import sys
import timer


#path = utils.findProgram ("NORNBINARY","norn")
FNULL = open(os.devnull, 'w')


def run (eq,timeout,ploc):
    path = ploc.findProgram ("norn")
    if not path:
        raise "Norn Not in Path"

    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    woorpje2smt.run (eq,smtfile,ploc)
    time = timer.Timer ()
    try:
        out = subprocess.check_output ([path,"+model",smtfile],timeout=timeout,stderr=FNULL).decode().strip()
    except subprocess.TimeoutExpired:
        return None,timeout,True,1
    except subprocess.CalledProcessError:
        return None,timeout,False,1
    time.stop()
	
    shutil.rmtree (tempd)
    if out.startswith("sat"):
        return True,time.getTime(),False,1
    elif out.startswith("unsat"):
        return False,time.getTime (),False,1
    return None,time.getTime  (),False,1

if __name__ == "__main__":
    print(run (sys.argv[1],None))

