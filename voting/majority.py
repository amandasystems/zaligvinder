import os 
import tempfile
import shutil
import re

class MajorityVoter:

    # dirty HACK
    def _extractAssignment(self,model):
        s = ""
        for l in model:
            s+=l.rstrip("\n")

        return s[len("(model"):-1]



        #    
        assignment = dict()
        currentWords = []
        in_qutation = False
        previous_char = ''
        for a in s:
            if a == "(" and not in_qutation:
                currentWords+=[""]
            elif a == ")" and not in_qutation:
                if len(currentWords) > 0:
                    w = currentWords.pop()
                    if w.startswith("define-fun"):
                        w_split = w.split()
                        variable = w_split[1]
                        if w_split[3] == "String":
                            substitution = w[w.find(' "')+1:]
                        elif w_split[3] == "Int":
                            if w_split[4] == "-":
                                substitution = "(- "+str(int(re.sub("[^0-9]", "", w_split[5]))) + ")" #-int(re.sub("[^0-9]", "", w_split[5]))
                            else:
                                substitution = int(re.sub("[^0-9]", "",w_split[4]))
                        else:
                            print(w_split[3],variable, int(re.sub("[^0-9]", "",w_split[4]))) 
                            #raise("Variabletype " + str(w_split[3]) + " not known!")
                        assignment[variable] = substitution
                currentWords = [w+a for w in currentWords]
            else:
                if a == '"' and not previous_char == "\\":
                    in_qutation = not in_qutation
                currentWords = [w+a for w in currentWords]
            previous_char = a
                
        return assignment

    def _modifyInputFile(self,tempd,model,filepath):
        smtfile = os.path.join (tempd,"out.smt")
        f=open(filepath,"r")
        copy=open(smtfile,"w")
        firstLine = None
        #modelEntered = False
        declareBlockReached = False
        for l in f:
            if not l.startswith(";") and firstLine == None:
                firstLine = True

            # set (set-logic ALL) if no logic was set
            if "(set-logic" not in l and firstLine:
                copy.write("(set-logic ALL)\n")    
            
            if firstLine:
                firstLine = False

            if "(define-fun" in l or "(declare-fun" in l: 
                if declareBlockReached == False:
                    declareBlockReached = True   
            elif declareBlockReached == True:
                copy.write(model)
                declareBlockReached = None
            elif "(get-model)" not in l:
                copy.write(l)


            #if modelEntered == False and "(check-sat)" in l: 
            #    for variable in assignment:
            #        copy.write("(assert (= "+variable+" "+str(assignment[variable])+"))\n")
            #    modelEntered  = True
            
            #if "(get-model)" not in l:
            #    copy.write(l)

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
                            thisRes =  verifiers[v].run(assertedInputFile,timeout,ploc,os.path.abspath(".")).result
                            vRes = vRes and thisRes
                        r[i].verified = vRes
                        print(vRes)
                        shutil.rmtree (tempd)
                toolResults = [r[i] for r in res.values ()]

                verifiedResults = [r.verified for r in toolResults]
                if r[i].result == True:
                    print(verifiedResults)
                if True in verifiedResults:
                    verifiedTrue = True
                elif False in verifiedResults:
                    verifiedTrue = False
                else:
                    verifiedTrue = None

                tts = [r for r in toolResults if r.result == True and r.verified == True]
                ffs = [r for r in toolResults if r.result == False]
                unk = [r for r in toolResults if r.result == None]
                ctts = len(tts)
                cffs = len(ffs)
                cunk = len(unk)
                if ctts > 0 or cffs > 0:
                    #Someone made a conclusion
                    if ctts > cffs or verifiedTrue:
                        #More True votes
                        inst.expected = True
                        
                    elif cffs > ctts:
                        #More False votes
                        inst.expected = False
                
