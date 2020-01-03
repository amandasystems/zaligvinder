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
        return utils.Result(None,timeout,True,1)
    except subprocess.CalledProcessError:
        return utils.Result(None,timeout,False,1)
    time.stop()
	
    shutil.rmtree (tempd)
    if out.startswith("sat"):
        return utils.Result(True,time.getTime(),False,1)
    elif out.startswith("unsat"):
        return utils.Result(False,time.getTime (),False,1)
    return utils.Result(None,time.getTime  (),False,1)
