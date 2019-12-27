import webserver.views

class Router:
    def __init__(self):
        self._endpoints = {}

    def doRouting (self,path,params):
        if path in self._endpoints:
            return self._endpoints[path] (params)
        else:
            return webserver.views.ErrorText ("Unknown Endpoint")
    
    def addEndpoint (self,name,callable):
        self._endpoints[name] = callable
        
