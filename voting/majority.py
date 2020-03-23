import os 
import tempfile
import shutil
import re
import sys
from functools import reduce

class MajorityVoter:
    def voteOnResult (self,track,res,verifiers=dict()):
        name,instances = track.name,track.instances
        for i,inst in enumerate(instances):
            if inst.expected == None:
                toolResults = [r[i] for r in res.values ()]


                satVerified = False
                if len(list(verifiers.keys())) > 0:
                    satVerified = reduce((lambda x, y: x or y), [r.verified for r in toolResults if r.result == True])

                tts = [r for r in toolResults if r.result == True and r.verified != False]
                ffs = [r for r in toolResults if r.result == False]
                unk = [r for r in toolResults if r.result == None]
                ctts = len(tts)
                cffs = len(ffs)
                cunk = len(unk)
                if ctts > 0 or cffs > 0:
                    #Someone made a conclusion
                    if ctts > cffs or satVerified:
                        #More True votes or at least on verified answer
                        inst.expected = True
                        
                    elif cffs > ctts:
                        #More False votes
                        inst.expected = False
