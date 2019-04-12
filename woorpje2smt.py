import sys
import subprocess

tool = "/home/caramon/Development/wordsolve/build/woorpje2SMT"

def run (eqfile,outfile):
    subprocess.run ([tool,eqfile,outfile])

if __name__ == "__main__":
    run (sys.argv[1],sys.argv[2])


