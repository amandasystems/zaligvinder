class MajorityVoter:
    def voteOnResult (self,track,res):
        name,instances = track.name,track.instances
        for i,inst in enumerate(instances):
            if inst.expected == None:
                toolResults = [r[i] for r in res.values ()]
                tts = [r for r in toolResults if r.result == True]
                ffs = [r for r in toolResults if r.result == False]
                unk = [r for r in toolResults if r.result == None]
                ctts = len(tts)
                cffs = len(ffs)
                cunk = len(unk)
                print (ctts,cffs,cunk)
                if ctts > 0 or cffs > 0:
                    #Someone made a conclusion
                    if ctts > cffs:
                        #More True votes
                        inst.expected = True
                        
                    elif cffs > ctts:
                        #More False votes
                        inst.expected = False
                

