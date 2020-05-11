def getTrackData (bname = None):
    import models.SMTLIB.Jiangslent
    import models.SMTLIB.JiangslogQFS
    import models.SMTLIB.KeplerQFSLIA
    import models.SMTLIB.fullstrintpyconbytecvc4QFSLIA
    import models.SMTLIB.fullstrintpyconbytetraucQFSLIA
    import models.SMTLIB.fullstrintpyconbytez3seqQFSLIA
    import models.SMTLIB.fullstrintpyconbytez3strQFSLIA
    import models.SMTLIB.strpredsmallrw
    import models.SMTLIB.strtermsmallrw
    import models.SMTLIB.sygusqgen
    import models.SMTLIB.sygusqgenqueriesQFS
    import models.SMTLIB.sygusqgenqueriesnoreeQFS
    res = []
    for k in [
    		  #models.SMTLIB.Jiangslent,
    		  #models.SMTLIB.JiangslogQFS,
    		  #models.SMTLIB.KeplerQFSLIA,
    		  #models.SMTLIB.fullstrintpyconbytecvc4QFSLIA,
    		  #models.SMTLIB.fullstrintpyconbytetraucQFSLIA,
    		  #models.SMTLIB.fullstrintpyconbytez3seqQFSLIA,
    		  #models.SMTLIB.fullstrintpyconbytez3strQFSLIA,
    		  #models.SMTLIB.strpredsmallrw,
                  #models.SMTLIB.strtermsmallrw,
    		  #models.SMTLIB.sygusqgenqueriesQFS,
    		  models.SMTLIB.sygusqgenqueriesnoreeQFS,
              ]:
        res = res+k.getTrackData (bname or "SMTLIB")
    return res
