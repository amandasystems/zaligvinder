

def getTrackData (bname = None):
    import models.stringfuzz.concats_small
    import models.stringfuzz.many_regexes
    import models.stringfuzz.regex_lengths
    import models.stringfuzz.concats_balanced
    import models.stringfuzz.different_prefix
    import models.stringfuzz.overlaps_big
    import models.stringfuzz.regex_pair
    import models.stringfuzz.concats_big
    import models.stringfuzz.lengths_concats
    import models.stringfuzz.overlaps_small
    import models.stringfuzz.regex_small
    import models.stringfuzz.concats_extracts_big
    import models.stringfuzz.lengths_long
    import models.stringfuzz.regex_big
    import models.stringfuzz.concats_extracts_small
    import models.stringfuzz.lengths_short
    import models.stringfuzz.regex_deep
    res = []
    for k in [models.stringfuzz.concats_small,
              models.stringfuzz.many_regexes,
              models.stringfuzz.regex_lengths,
              models.stringfuzz.concats_balanced,
              models.stringfuzz.different_prefix,
              models.stringfuzz.overlaps_big,
              models.stringfuzz.regex_pair,
              models.stringfuzz.concats_big,
              models.stringfuzz.lengths_concats,
              models.stringfuzz.overlaps_small,
              models.stringfuzz.regex_small,
              models.stringfuzz.concats_extracts_big,
              models.stringfuzz.lengths_long,
              models.stringfuzz.regex_big,
              models.stringfuzz.concats_extracts_small,
              models.stringfuzz.lengths_short,
              models.stringfuzz.regex_deep]:
        res = res+k.getTrackData(bname or "StringFuzz")
    return res
              

