import os
import shutil

class Result:
    def __init__(self,result,time,timeouted,smtcalls):
        self.result = result
        self.time = time
        self.timeouted = timeouted
        self.smtcalls = smtcalls
                 

def findProgram (environmentvar,toolname):
    return os.environ.get(environmentvar) or shutil.which (toolname) 
