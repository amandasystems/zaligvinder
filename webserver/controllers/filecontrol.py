import webserver.views.TextView
import webserver.files

class FileControl:
    def __init__(self):
        self._locator = webserver.files.FileLocator ()

    def findFile (self,params):
        f =  self._locator.findFile (params["path"])
        if f:
            return webserver.views.TextView.TextView (f.read())
        return webserver.views.TextView.ErrorText ("File Not available")
