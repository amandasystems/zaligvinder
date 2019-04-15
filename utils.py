import os
import shutil

def findProgram (environmentvar,toolname):
    return os.environ.get(environmentvar) or shutil.which (toolname) 
