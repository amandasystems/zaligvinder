import os 
import tempfile
import shutil
import re
import sys

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

    def _translateSMTFile(self,filepath):
        f=open(filepath,"r")
        matchingBraces = 0
        firstMatchFound = False
        currentWord = ""
        in_qutation = False
        previous_char = None
        for l in f:
            if l.startswith(";"):
                continue
            for a in l:
                if a == "(" and not in_qutation:
                    matchingBraces+=1
                    firstMatchFound = True
                if a == ")" and not in_qutation:
                    matchingBraces-=1

                if firstMatchFound == True:
                    if a == '"' and not previous_char == '\\':
                        in_qutation = not in_qutation
                    previous_char = a
                    currentWord+=a

                if matchingBraces == 0 and len(currentWord) > 0 and firstMatchFound:
                    yield currentWord
                    currentWord = ""
        f.close()

    def _modifyInputFile(self,tempd,model,filepath):
        smtfile = os.path.join (tempd,"out.smt")
        copy=open(smtfile,"w")
        firstLine = None
        #modelEntered = False
        declareBlockReached = False
        for l in self._translateSMTFile(filepath):
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
                copy.write("\n"+model+"\n")
                declareBlockReached = None
            elif "(get-model)" not in l:
                copy.write(l+"\n")


            #if modelEntered == False and "(check-sat)" in l: 
            #    for variable in assignment:
            #        copy.write("(assert (= "+variable+" "+str(assignment[variable])+"))\n")
            #    modelEntered  = True
            
            #if "(get-model)" not in l:
            #    copy.write(l)

        copy.write("\n(get-model)")
        copy.close()
        return smtfile

    def progressMessage (self,cur,total):
        sys.stdout.write ("\x1b[2K\r[ Model verification  - {0}/{1} ]".format(cur+1,total))

    def voteOnResult (self,track,res,timeout=0,ploc=None,verifiers=dict()):
        sys.stdout.write("Starting verification.\n")
        name,instances  = track.name,track.instances
        totalCount = len(instances)
        verifierCount = len(list(verifiers.keys()))
        verifiedTrue = None
        for i,inst in enumerate(instances):
            self.progressMessage(i,totalCount)
            if inst.expected == None:
                toolResults = [r[i] for r in res.values ()] 
                if verifierCount > 0:
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
                            shutil.rmtree (tempd)
                    verifiedResults = [r.verified for r in toolResults]
                    toolAnswers = [r.result for r in toolResults]
                    verifiedTrue = None
                    if True in toolAnswers:
                        if True in verifiedResults:
                            verifiedTrue = True
                        elif False in verifiedResults:
                            verifiedTrue = False
                        else:
                            verifiedTrue = None

                tts = [r for r in toolResults if r.result == True and (r.verified == True or verifierCount == 0)]
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
        sys.stdout.write("\n")
