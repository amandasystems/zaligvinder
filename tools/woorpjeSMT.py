import sys
import subprocess
import shutil
import timer
import utils
import ntpath

#tool = utils.findProgram ("WOORPJESMTBINARY","woorpjeSMT")

def extractFile(eqfile,sfile):
    fileName=ntpath.basename(eqfile)
    #dest="/root/words/benchmarkExtract/benchmarkTool/kaluzaSmallSatExtracted/"
    #shutil.copyfile(eqfile, dest+fileName)
    shutil.copyfile(eqfile, dest+"/simplify/"+fileName)

def run (eqfile,timeout,ploc):
    #sfile = "/root/words/benchmarkExtract/benchmarkTool/kaluzaSmallSatExtracted/test.smt"
    tool = ploc.findProgram ("woorpjeSMT")
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
                return utils.Result(None,time.getTime (),False,0)
            elif ex.returncode == 1:
                return utils.Result(False,time.getTime (),False,0)
            elif ex.returncode == 134 or ex.returncode == 255:
                return utils.Result(None,0,False,0)
            else:
                return utils.Result(None,time.getTime (),False,0)
        except subprocess.TimeoutExpired:
            #extractFile(eqfile,sfile)
            return utils.Result(None,timeout,True,0)


    else:
        raise "woorpje Not in Path"

    def addRunner (addto):
        addto['woorpje'] = run

    
if __name__ == "__main__":
    print (run (sys.argv[1],None))
