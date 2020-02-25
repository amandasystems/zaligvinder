def getTrackData (bname = None):
    import models.models.Leetcode
    import models.models.PyEx
    import models.models.appscan
    import models.models.banditfuzz
    import models.models.cashewsuite
    import models.models.joacosuite
    import models.models.kaluza
    import models.models.kauslersuite
    import models.models.light
    import models.models.nornbenchmarks
    import models.models.pisa
    import models.models.slothtests
    import models.models.strangersuite
    import models.models.stringfuzz
    import models.models.test
    import models.models.woorpje
    import models.models.z3regression
    res = []
    for k in [
    		  models.models.Leetcode,
    		  models.models.PyEx,
    		  models.models.appscan,
    		  models.models.banditfuzz,
    		  models.models.cashewsuite,
    		  models.models.joacosuite,
    		  models.models.kaluza,
    		  models.models.kauslersuite,
    		  models.models.light,
    		  models.models.nornbenchmarks,
    		  models.models.pisa,
    		  models.models.slothtests,
    		  models.models.strangersuite,
    		  models.models.stringfuzz,
    		  models.models.test,
    		  models.models.woorpje,
    		  models.models.z3regression,
              ]:
        res = res+k.getTrackData (bname or "models")
    return res
