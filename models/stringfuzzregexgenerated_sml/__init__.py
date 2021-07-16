def getTrackData (bname = None):
    import models.stringfuzzregexgenerated_sml.manyregexes
    import models.stringfuzzregexgenerated_sml.regexbig
    import models.stringfuzzregexgenerated_sml.regexdeep
    import models.stringfuzzregexgenerated_sml.regexlengths
    import models.stringfuzzregexgenerated_sml.regexpair
    import models.stringfuzzregexgenerated_sml.regexsmall
    import models.stringfuzzregexgenerated_sml.variants
    res = []
    for k in [
    		  models.stringfuzzregexgenerated_sml.manyregexes,
    		  models.stringfuzzregexgenerated_sml.regexbig,
    		  models.stringfuzzregexgenerated_sml.regexdeep,
    		  models.stringfuzzregexgenerated_sml.regexlengths,
    		  models.stringfuzzregexgenerated_sml.regexpair,
    		  models.stringfuzzregexgenerated_sml.regexsmall,
    		  models.stringfuzzregexgenerated_sml.variants,
              ]:
        res = res+k.getTrackData (bname or "stringfuzzregexgenerated_sml")
    return res
