import sys
import subprocess
import shutil
import timer
import utils
import ntpath

tool = utils.findProgram ("WOORPJESMTBINARY","woorpjeSMT")

def extractFile(eqfile,sfile):
    fileName=ntpath.basename(eqfile)
    #dest="/root/words/benchmarkExtract/benchmarkTool/kaluzaSmallSatExtracted/"
    #shutil.copyfile(eqfile, dest+fileName)
    shutil.copyfile(eqfile, dest+"/simplify/"+fileName)

def run (eqfile,timeout):
    #sfile = "/root/words/benchmarkExtract/benchmarkTool/kaluzaSmallSatExtracted/test.smt"
    if tool:
        try:
            time = timer.Timer ()
            out = subprocess.check_output ([tool, '--solver', '1' ,'-S','1','--smttimeout', '10', eqfile],timeout=timeout)
            #out = subprocess.check_output ([tool,'--simplify', eqfile],timeout=timeout)
            #print(out.decode().strip())
            time.stop ()
            #extractFile(eqfile,sfile)
            return True,time.getTime(),False,0
        except subprocess.CalledProcessError as ex:
            time.stop ()

            if ex.returncode == 0:
                extractFile(eqfile,sfile)


            if ex.returncode == 10 or ex.returncode == 20:
                return None,time.getTime (),False,0
            elif ex.returncode == 1:
                return False,time.getTime (),False,0
            elif ex.returncode == 134 or ex.returncode == 255:
                return None,0,False,0
            else:
                return None,time.getTime (),False,0
        except subprocess.TimeoutExpired:
            #extractFile(eqfile,sfile)
            return None,timeout,True,0


    else:
        raise "woorpje Not in Path"

if __name__ == "__main__":
    print (run (sys.argv[1],None))
