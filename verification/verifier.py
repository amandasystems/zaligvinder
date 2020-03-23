import os 
import tempfile
import shutil
import re
import sys


# import all tools
from tools import *

class Verfier:
    def _extractAssignment(self,model):
        s = ""
        for l in model:
            s+=l.rstrip("\n")

        return s[len("(model"):-1]

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

    def getSolverRun(self,solvername):
        if os.path.exists("tools/"+solvername+".py")

    def verifyModel (self,res,ploc,filepath,timeout=0,verifiers=dict()):
        print(os.path.exists("tools/cvc4.py"))
        
        
        assert(res.result == True)

        verifierCount = len(list(verifiers.keys()))
        if verifierCount > 0:
            vRes = None
            foundModel = self._extractAssignment(res.model)
            tempd = tempfile.mkdtemp ()
            assertedInputFile = self._modifyInputFile(tempd,foundModel,filepath)
            for v in verifiers:
                thisRes = verifiers[v].run(assertedInputFile,timeout,ploc,os.path.abspath(".")).result
                # work arround if we verified the model at least once
                if (thisRes == True and vRes == None) or (thisRes == None and vRes == True):
                    vRes == True
                else:
                    vRes == vRes and thisRes
            res.verified == vRes
            shutil.rmtree (tempd)
        return res
