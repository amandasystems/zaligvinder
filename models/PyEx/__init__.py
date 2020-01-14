def getTrackData (bname = None):
    import models.PyEx.httplib2cachecontrol
    import models.PyEx.httplib2endheaders
    import models.PyEx.httplib2entrydisposition
    import models.PyEx.httplib2normalizeheaders
    import models.PyEx.httplib2requestheaders
    import models.PyEx.httplib2safename
    import models.PyEx.httplib2wwwauthenticate
    import models.PyEx.pipdistutilsscheme
    import models.PyEx.pipisurl
    import models.PyEx.pycache
    import models.PyEx.pymongobsonencode
    import models.PyEx.pymongoloads
    import models.PyEx.pymongomongoclient
    import models.PyEx.pymongoobjectid
    import models.PyEx.requestsaddressinnetwork
    import models.PyEx.requestscookiejar
    import models.PyEx.requestscookies
    import models.PyEx.requestsrequoteuri
    import models.PyEx.requestsurlauth
    import models.PyEx.requestsvalidcidr
    res = []
    for k in [
    		  models.PyEx.httplib2cachecontrol,
    		  models.PyEx.httplib2endheaders,
    		  models.PyEx.httplib2entrydisposition,
    		  models.PyEx.httplib2normalizeheaders,
    		  models.PyEx.httplib2requestheaders,
    		  models.PyEx.httplib2safename,
    		  models.PyEx.httplib2wwwauthenticate,
    		  models.PyEx.pipdistutilsscheme,
    		  models.PyEx.pipisurl,
    		  models.PyEx.pycache,
    		  models.PyEx.pymongobsonencode,
    		  models.PyEx.pymongoloads,
    		  models.PyEx.pymongomongoclient,
    		  models.PyEx.pymongoobjectid,
    		  models.PyEx.requestsaddressinnetwork,
    		  models.PyEx.requestscookiejar,
    		  models.PyEx.requestscookies,
    		  models.PyEx.requestsrequoteuri,
    		  models.PyEx.requestsurlauth,
    		  models.PyEx.requestsvalidcidr,
              ]:
        res = res+k.getTrackData (bname or "PyEx")
    return res
