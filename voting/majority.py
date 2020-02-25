import os 
import tempfile
import shutil

class MajorityVoter:

    # dirty HACK
    def _extractAssignment(self,model):
        s = ""
        for l in model:
            s+=l.rstrip("\n")
        assignment = dict()
        currentWords = []
        for a in s:
            if a == "(":
                currentWords+=[""]
            elif a == ")":
                if len(currentWords) > 0:
                    w = currentWords.pop()
                    if w.startswith("define-fun"):
                        substitution = w[w.find(' "')+1:]
                        variable = w.split()[1]
                        assignment[variable] = substitution
            else:
                currentWords = [w+a for w in currentWords]
        return assignment

    def _modifyInputFile(self,tempd,assignment,filepath):
        smtfile = os.path.join (tempd,"out.smt")
        f=open(filepath,"r")
        copy=open(smtfile,"w")
        firstLine = None
        modelEntered = False
        for l in f:
            if not l.startswith(";") and firstLine == None:
                firstLine = True

            # set (set-logic ALL) if no logic was set
            if "(set-logic" not in l and firstLine:
                copy.write("(set-logic ALL)\n")    
            
            if firstLine:
                firstLine = False

            if modelEntered == False and "(check-sat)" in l: 
                for variable in assignment:
                    copy.write("(assert (= "+variable+" "+assignment[variable]+"))\n")
                modelEntered  = True
            
            if "(get-model)" not in l:
                copy.write(l)

        copy.write("\n(get-model)")
        f.close()
        copy.close()
        return smtfile

    def voteOnResult (self,track,res,timeout=0,ploc=None,verifiers=dict()):
        name,instances  = track.name,track.instances
        for i,inst in enumerate(instances):
            if inst.expected == None:
                
                # Verification of a result
                for r in res.values():
                    if r[i].result == True:
                        vRes = True
                        filepath = inst.filepath
                        foundModel = self._extractAssignment(r[i].model)
                        tempd = tempfile.mkdtemp ()
                        assertedInputFile = self._modifyInputFile(tempd,foundModel,filepath)
                        for v in verifiers:
                            vRes = vRes and verifiers[v].run(assertedInputFile,timeout,ploc,os.path.abspath(".")).result
                        r[i].verified = vRes
                        shutil.rmtree (tempd)

                toolResults = [r[i] for r in res.values ()]
                tts = [r for r in toolResults if r.result == True and r.verified == True]
                ffs = [r for r in toolResults if r.result == False]
                unk = [r for r in toolResults if r.result == None]
                ctts = len(tts)
                cffs = len(ffs)
                cunk = len(unk)
                if ctts > 0 or cffs > 0:
                    #Someone made a conclusion
                    if ctts > cffs:
                        #More True votes
                        inst.expected = True
                        
                    elif cffs > ctts:
                        #More False votes
                        inst.expected = False
                
