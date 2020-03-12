def getTrackData (bname = None):
    import models.stringfuzzWoorpje.concatsbalanced
    import models.stringfuzzWoorpje.concatsbig
    import models.stringfuzzWoorpje.concatssmall
    import models.stringfuzzWoorpje.differentprefix
    import models.stringfuzzWoorpje.lengthsconcats
    import models.stringfuzzWoorpje.lengthslong
    import models.stringfuzzWoorpje.lengthsshort
    import models.stringfuzzWoorpje.overlapsbig
    import models.stringfuzzWoorpje.overlapssmall
    res = []
    for k in [
    		  models.stringfuzzWoorpje.concatsbalanced,
    		  models.stringfuzzWoorpje.concatsbig,
    		  models.stringfuzzWoorpje.concatssmall,
    		  models.stringfuzzWoorpje.lengthsconcats,
    		  models.stringfuzzWoorpje.lengthslong,
    		  models.stringfuzzWoorpje.lengthsshort,
    		  models.stringfuzzWoorpje.overlapsbig,
    		  models.stringfuzzWoorpje.overlapssmall,
              ]:
        res = res+k.getTrackData (bname or "stringfuzzWoorpje")
    return res
