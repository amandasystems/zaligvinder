import sys
import subprocess
import shutil
import timer
import utils

#tool = utils.findProgram ("WOORPJEBINARY","woorpje")

def run (eqfile,timeout,ploc):
    path = ploc.findProgram ("woorpje")
    
    if tool:
        try:
            time = timer.Timer ()
            out = subprocess.check_output ([tool, '--solver', '1' ,'-S','1','--smttimeout', '10', eqfile],timeout=timeout)
            #out = subprocess.check_output ([tool,'--simplify', eqfile],timeout=timeout)
            #print(out.decode().strip())
            time.stop ()
            return utils.Result(True,time.getTime(),False,0,out)
        except subprocess.CalledProcessError as ex:
            
            time.stop ()
            if ex.returncode == 10 or ex.returncode == 20:
                return utils.Result(None,time.getTime (),False,0,ex.output)
            elif ex.returncode == 1:
                return utils.Result(False,time.getTime (),False,0,ex.output)
            else:
                return utils.Result(None,time.getTime (),False,0,ex.output)
        except subprocess.TimeoutExpired:
            return utils.Result(None,timeout,True,0)


    else:
        raise "woorpje Not in Path"
    
    
def runSMT (eqfile,timeout,ploc):
    import woorpje2smt
    toolsmt = utils.findProgram ("WOORPJESMTBINARY","woorpjeSMT")
    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    woorpje2smt.run (eq,smtfile)
    
    if tool:
        try:
            time = timer.Timer ()
            out = subprocess.check_output ([tool, '--solver', '1' ,'-S','1','--smttimeout', '10', eqfile],timeout=timeout)
            time.stop ()
            return True,time.getTime(),False,0
        except subprocess.CalledProcessError as ex:
            time.stop ()
            if ex.returncode == 10 or ex.returncode == 20:
                return None,time.getTime (),False,0
            elif ex.returncode == 1:
                return False,time.getTime (),False,0
            else:
                return None,time.getTime (),False,0
        except subprocess.TimeoutExpired:
            return None,timeout,True,0

    
    else:
        raise "woorpjeSMT Not in Path"

def addRunner (addto):
    addto['woorpje'] = run

    
if __name__ == "__main__":
    run (sys.argv[1],None)
