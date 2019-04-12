import woorpje2smt
import subprocess
import tempfile
import os
import shutil
import sys
import timer

path = "z3"

def run (eq):
    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    woorpje2smt.run (eq,smtfile)
    time = timer.Timer ()
    out = subprocess.check_output ([path,"smt.string_solver=z3str3",smtfile]).decode().strip()
    time.stop()
    shutil.rmtree (tempd)
    if out == "sat":
        return True,time.getTime()
    elif out  =="unsat":
        return False,time.getTime ()
    return None,time.getTime  ()
    
if __name__ == "__main__":
    print(run (sys.argv[1]))

