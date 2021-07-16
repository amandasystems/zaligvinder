def getTrackData (bname = None):
    import models.RegExBenchmarks_sml.appscan
    import models.RegExBenchmarks_sml.banditfuzz
    import models.RegExBenchmarks_sml.cashewsuite
    import models.RegExBenchmarks_sml.joacosuite
    import models.RegExBenchmarks_sml.kaluza
    import models.RegExBenchmarks_sml.nornbenchmarks
    import models.RegExBenchmarks_sml.slothtests
    import models.RegExBenchmarks_sml.strangersuite
    import models.RegExBenchmarks_sml.stringfuzz
    import models.RegExBenchmarks_sml.z3regression
    res = []
    for k in [
    		  models.RegExBenchmarks_sml.appscan,
    		  models.RegExBenchmarks_sml.banditfuzz,
    		  models.RegExBenchmarks_sml.cashewsuite,
    		  models.RegExBenchmarks_sml.joacosuite,
    		  models.RegExBenchmarks_sml.kaluza,
    		  models.RegExBenchmarks_sml.nornbenchmarks,
    		  models.RegExBenchmarks_sml.slothtests,
    		  models.RegExBenchmarks_sml.strangersuite,
    		  models.RegExBenchmarks_sml.stringfuzz,
    		  models.RegExBenchmarks_sml.z3regression,
              ]:
        res = res+k.getTrackData (bname or "RegExBenchmarks_sml")
    return res
