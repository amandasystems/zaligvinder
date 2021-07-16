def getTrackData (bname = None):
    import models.RegExBenchmarks.appscan
    # import models.RegExBenchmarks.banditfuzz
    # import models.RegExBenchmarks.cashewsuite
    # import models.RegExBenchmarks.joacosuite
    # import models.RegExBenchmarks.kaluza
    # import models.RegExBenchmarks.nornbenchmarks
    # import models.RegExBenchmarks.slothtests
    # import models.RegExBenchmarks.strangersuite
    import models.RegExBenchmarks.stringfuzz
    # import models.RegExBenchmarks.z3regression
    res = []
    for k in [
    		  models.RegExBenchmarks.appscan,
    		#   models.RegExBenchmarks.banditfuzz,
    		#   models.RegExBenchmarks.cashewsuite,
    		#   models.RegExBenchmarks.joacosuite,
    		#   models.RegExBenchmarks.kaluza,
    		#   models.RegExBenchmarks.nornbenchmarks,
    		#   models.RegExBenchmarks.slothtests,
    		#   models.RegExBenchmarks.strangersuite,
    		models.RegExBenchmarks.stringfuzz,
    		#   models.RegExBenchmarks.z3regression,
              ]:
        res = res+k.getTrackData (bname or "RegExBenchmarks")
    return res
