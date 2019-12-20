import sys
import subprocess
import utils
import os


def run (eqfile,outfile):
        if eqfile.endswith (".eq"): 
            tool =  utils.findProgram ("WOORPJE2SMT","woorpje2SMT")
            if tool:
                subprocess.run ([tool,eqfile,outfile])
                os.rename (outfile+"_1",outfile)
            else:
                raise "woorpje2SMT Not in Path" 
        else:
                import shutil
                shutil.copy (eqfile,outfile)

if __name__ == "__main__":
    run (sys.argv[1],sys.argv[2])


