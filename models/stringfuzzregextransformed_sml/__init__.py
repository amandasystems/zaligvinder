def getTrackData (bname = None):
    import models.stringfuzzregextransformed_sml.amazon
    import models.stringfuzzregextransformed_sml.z3str2
    res = []
    for k in [
    		  models.stringfuzzregextransformed_sml.amazon,
    		  models.stringfuzzregextransformed_sml.z3str2,
              ]:
        res = res+k.getTrackData (bname or "stringfuzzregextransformed_sml")
    return res
