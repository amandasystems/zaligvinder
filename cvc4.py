import woorpje2smt
import subprocess
import tempfile
import os
import shutil
import sys
import timer

path = shutil.which ("cvc4")

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
        return None,timeout
    except subprocess.CalledProcessError:
        return None,timeout
    time.stop ()
    shutil.rmtree (tempd)
    if out == "sat":
        return True, time.getTime()
    elif out  =="unsat":
        return False, time.getTime()
    return None,time.getTime()
    
if __name__ == "__main__":
    print(run (sys.argv[1]))
    
