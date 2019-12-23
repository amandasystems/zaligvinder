import os
import shutil

class Result:
    def __init__(self,result,time,timeouted,smtcalls):
        self.result = result
        self.time = time
        self.timeouted = timeouted
        self.smtcalls = smtcalls
                 

class TrackInstance:
    def __init__ (self,name,filepath):
        self.name = name
        self.filepath = filepath

class Track:
    def __init__ (self,trackname,instances = []):
        self.name = trackname
        self.instances = instances
        
def findProgram (environmentvar,toolname):
    return os.environ.get(environmentvar) or shutil.which (toolname) 
