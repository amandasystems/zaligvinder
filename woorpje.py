import sys
import subprocess
import shutil
import timer


tool = path = shutil.which ("woorpje") 

def run (eqfile,timeout):
    if tool:
        try:
            time = timer.Timer ()
            subprocess.check_output ([tool,eqfile],timeout=timeout)
            time.stop ()
            return True,time.getTime()
        except subprocess.CalledProcessError as ex:
            if ex.returncode == 10 or ex.returncode == 20:
                return None,time.getTime ()
            elif ex.returncode == 1:
                return False,time.getTime ()
            else:
                return None,time.getTime ()
        except subprocess.TimeoutExpired:
            return None,timeout
                
            
    else:
        raise "woorpje Not in Path" 

if __name__ == "__main__":
    run (sys.argv[1])

