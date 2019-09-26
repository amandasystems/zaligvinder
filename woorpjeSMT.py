import sys
import subprocess
import shutil
import timer
import utils
import ntpath

tool = utils.findProgram ("WOORPJESMTBINARY","woorpjeSMT")

def extractFile(eqfile,sfile):
    fileName=ntpath.basename(eqfile)
    dest="/root/words/benchmarkExtract/benchmarkTool/kaluzaSmallSatExtracted/"
    #shutil.copyfile(eqfile, dest+fileName)
    shutil.copyfile(eqfile, dest+"/simplify/"+fileName)

def run (eqfile,timeout):
    sfile = "/root/words/benchmarkExtract/benchmarkTool/kaluzaSmallSatExtracted/test.smt"
    if tool:
        try:
            time = timer.Timer ()
            out = subprocess.check_output ([tool, '--solver', '4' ,'-S','1','--smttimeout', '10', '--outputfile', sfile, eqfile],timeout=timeout)
            #out = subprocess.check_output ([tool,'--simplify', eqfile],timeout=timeout)
            #print(out.decode().strip())
            time.stop ()
            extractFile(eqfile,sfile)
            return True,time.getTime(),False
        except subprocess.CalledProcessError as ex:
            time.stop ()
            if ex.returncode == 10 or ex.returncode == 20:
                extractFile(eqfile,sfile)
                return None,time.getTime (),False
            elif ex.returncode == 1:
                extractFile(eqfile,sfile)
                return False,time.getTime (),False
            elif ex.returncode == 134 or ex.returncode == 255:
                print("Shitfile: " + eqfile)
                return None,0,False
            else:
                extractFile(eqfile,sfile)
                return None,time.getTime (),False
        except subprocess.TimeoutExpired:
            extractFile(eqfile,sfile)
            return None,timeout,True


    else:
        raise "woorpje Not in Path"

if __name__ == "__main__":
    run (sys.argv[1],None)
