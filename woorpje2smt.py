import sys
import subprocess
import utils
import os

tool =  utils.findProgram ("WOORPJE2SMT","woorpje2SMT")

def run (eqfile,outfile):
    if tool:
        subprocess.run ([tool,eqfile,outfile])
        os.rename (outfile+"_1",outfile)
    else:
        raise "woorpje2SMT Not in Path" 
if __name__ == "__main__":
    run (sys.argv[1],sys.argv[2])


