import os
import shutil

class Result:
    def __init__(self,result,time,timeouted,smtcalls,output = "None"):
        self.result = result
        self.time = time
        self.timeouted = timeouted
        self.smtcalls = smtcalls
        self.output = output
                 

class TrackInstance:
    def __init__ (self,name,filepath):
        self.name = name
        self.filepath = filepath

class Track:
    def __init__ (self,trackname,instances = []):
        self.name = trackname
        self.instances = instances

class ReferenceResult:
    def __init__(self,result,satissolvers,nsatissolvers):
        self.result=result
        self.satissolvers = satissolvers
        self.nsatissolvers = nsatissolvers
        
class ProgramLocator:
    def __init__(self):
        self._map = {
            'woorpje' : 'WOORPJEBINARY',
            'cvc4' : 'CVC4BINARY',
            'norn' : 'NORNBINARY',
            'woorpjeSMT' : 'WOORPJESMTBINARY',
            'Z3' : 'Z3BINARY',
            }
        
    def findProgram (self,toolname):
        environmentvar = self._map.get(toolname,toolname)
        return os.environ.get(environmentvar) or shutil.which (toolname) 

class JSONProgramConfig:
    def __init__(self,configfile = "./toolconfig.json"):
        import json
        with open(configfile) as config_file:
            data = json.load(config_file)
        self._tools = data["Binaries"]

    def findProgram (self,toolname):
        return self._tools[toolname]['path']
