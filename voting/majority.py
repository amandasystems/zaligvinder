import os 
import tempfile
import shutil
import re
import sys

from multiprocessing import Pool
from multiprocessing import current_process


class MajorityVoter:
    def __init__(self,cores = 60):
        self._cores = cores
        
    # dirty HACK
    def _extractAssignment(self,model):
        s = ""
        for l in model:
            s+=l.rstrip("\n")
        return s[len("(model"):-1]

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

        copy.write("\n(get-model)")
        copy.close()
        return smtfile


    def processInstance(self,filepath):
        splitInput = self._translateSMTFile(filepath):
        preamble = "(set-logic ALL)\n" if "(set-logic" not in splitInput[0] else splitInput[0]+"\n"
        base = ""
        for l in splitInput[1:]:
            if "(define-fun" not in l and "(declare-fun" not in l and "(get-model)" not in l:
                base+=l+"\n"
        base+="\n(get-model)"
        return (preamble,base)

    def mergeModel(self,tempd,preamble,base,model):
        smtfile = os.path.join (tempd,"out.smt")
        copy=open(smtfile,"w")
        for l in [preamble,model,base]:
            copy.write(l+"\n")
        copy.close()
        return smtfile

    def progressMessage (self,cur,total):
        sys.stdout.write ("\x1b[2K\r[ Model verification  - {0}/{1} ]".format(cur+1,total))


    def runSpecific (self,tup):
    try:
        solvername,func,model,timeout,ploc = tup
        progressMessage (model,solvername)
        tempd = tempfile.mkdtemp ()
        result = func(model.filepath,timeout,ploc,tempd)
        shutil.rmtree (tempd)    
        return result
    except Exception as e:
        print (str(e))
        shutil.rmtree (tempd)
        return utils.Result(None,timeout,True,0,str(e))


    def voteSpecific(self,res,inst,i,verifiers,timeout,ploc):
        toolResults = [r[i] for r in res.values ()] 
        verifierCount = len(list(verifiers.keys()))
        # Verification of a result
        if verifierCount > 0:
            inputPreamble,inputCore = processInstance(inst.filepath)
            for r in res.values():
                if r[i].result == True:
                    vRes = True
                    model = self._extractAssignment(r[i].model)
                    tempd = tempfile.mkdtemp ()
                    assertedInputFile = self.mergeModel(tempd,inputPreamble,inputCore,model)
                    for v in verifiers:


                        thisRes =  verifiers[v].run(assertedInputFile,timeout,ploc,os.path.abspath(".")).result


                        vRes = vRes and thisRes
                    r[i].verified = vRes
                    shutil.rmtree (tempd)
            verifiedResults = [r.verified for r in toolResults]
            toolAnswers = [r.result for r in toolResults]

            # check whether we found at least on valid model
            if True in toolAnswers and True in verifiedResults:
                #inst.expected = True
                return (i,True)


        # found a valid model; skip majority vote
        if inst.expected != None:
            continue

        # falling back to majority vote
        tts = [r for r in toolResults if r.result == True and not r.verified == False]
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




    def voteOnResult (self,track,res,timeout=0,ploc=None,verifiers=dict()):
        sys.stdout.write("Starting verification.\n")
        name,instances  = track.name,track.instances
        totalCount = len(instances)
        tasks = []
        for i,inst in enumerate(instances):
            self.progressMessage(i,totalCount)
            if inst.expected == None:
                tasks.append((res,inst,i,verifiers,timeout,ploc))
        with Pool (self._cores) as p:
            p.map (voteSpecific,tasks)





        sys.stdout.write("\n")
