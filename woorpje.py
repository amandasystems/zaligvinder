import sys
import subprocess
import shutil
import timer
import utils

tool = utils.findProgram ("WOORPJEBINARY","woorpje")

def run (eqfile,timeout):
    if tool:
        try:
            time = timer.Timer ()
            subprocess.check_output ([tool,'--simplify',eqfile],timeout=timeout)
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

