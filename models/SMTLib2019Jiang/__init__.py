def getTrackData (bname = None):
    import models.SMTLib2019Jiang.slog
    res = []
    for k in [
    		  models.SMTLib2019Jiang.slog,
              ]:
        res = res+k.getTrackData (bname or "SMTLib2019Jiang")
    return res
