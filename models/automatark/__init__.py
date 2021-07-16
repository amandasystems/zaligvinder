def getTrackData (bname = None):
    import models.automatark.complexnew
    import models.automatark.simplenew
    res = []
    for k in [
    		  models.automatark.complexnew,
    		  models.automatark.simplenew,
              ]:
        res = res+k.getTrackData (bname or "automatark25")
    return res
