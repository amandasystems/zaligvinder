#!/usr/bin/python

from runners.multi import TheRunner as testrunner
import utils
import storage
import voting.majority as voting
import tools.z3seq
import tools.z3str3
import tools.cvc4
import tools.dummy
#import models.woorpje.track01

import models.woorpje
import models.kaluza
import models.PyEx_All
import models.pisa
import models.nornbenchmarks
import models.stringfuzz
import models.z3_regression
import models.appscan
import models.slothtests
import models.light
import models.Leetcode
import models.cashewsuite
import models.joacosuite
import models.strangersuite
import models.kauslersuite
import models.banditfuzz
#import models.SMTLIB
#import models.SMTLIB_UCHAR
import models.RegExBenchmarks
import startwebserver


import tools.cvc4_16
import tools.z3str3_old


import summarygenerators
tracks = (#models.PyEx_All.getTrackData () +
          #models.SMTCompQFS.getTrackData() +
          #models.SMTCompQFSLIA.getTrackData() + 
          #models.SMTLIB_UCHAR.getTrackData() +
          #models.pisa.getTrackData ("Pisa") +
          #models.nornbenchmarks.getTrackData ("Norn") +
          #models.light.getTrackData("Trau Light")+
          #models.Leetcode.getTrackData ("Leetcode Strings") + 
          #models.appscan.getTrackData ( "IBM Appscan") + 
          #models.slothtests.getTrackData ("Sloth") +
          #models.woorpje.getTrackData ("Woorpje Word Equations") +
          #models.kaluza.getTrackData ("Kaluza") +
          #models.stringfuzz.getTrackData ("StringFuzz") +
          #models.z3_regression.getTrackData("z3Str3 Regression")+
          #models.cashewsuite.getTrackData ("Cashew") + 
          #models.joacosuite.getTrackData ("JOACO") +
          #models.strangersuite.getTrackData ("Stranger") +
          #models.kauslersuite.getTrackData ("Kausler") +
          #models.banditfuzz.getTrackData("BanditFuzz") +
          models.RegExBenchmarks.getTrackData("RegEx") +
        []
        )


#import models.unknown


#tracks = (models.unknown.getTrackData()+
#          #models.probetrue.getTrackData()+
#          models.probefalse.getTrackData()+
#          #models.probeunknown.getTrackData()+
#          #models.arrvsseq.getTrackData()+
#          [])

#solvers = {
#    'z3str3-portfolio' : tools.z3str3portfolio.run,
#    'z3str3' : tools.z3str3.run,
#    'z3seq' : tools.z3seq.run,
#    'cvc4' : tools.cvc4.run,
    #'trau' : toQols.trau.run
    #'norn' :  tools.norn.run,
    #'woorpje' :  tools.woorpjeSMT.run
#}
smtsolvers = ["cvc4"]

solvers = {}
for s in [tools.cvc4_16,
          tools.cvc4,
          tools.z3str3,
          tools.z3str3_old,
          #tools.z3str3Mku
          #tools.z3str3Multi
          #tools.z3str4FSEArms,
          #tools.z3str4Arms,
          #tools.z3str4RegBug,
          #tools.z3str3Multi
          tools.z3str4Reg,
          #tools.z3str3Multi
          #tools.cvc4,
          #tools.z3seq,
          #tools.z3str3,
          #tools.z3seq_old,
          #tools.z3str4,
          #tools.z3str4arith
          #tools.z3str4_old,
          #tools.z3str4FSE
          #tools.z3seqtimeout
          #tools.z3str3,
          #tools.z3str4,
          #tools.z3str4FSE,
          #tools.z3str3length,
          #tools.z3str4multi,
          #tools.z3str4murphy,
          #tools.z3str4federico,
          #tools.z3str3NoOverlaps,
          #tools.z3str3overlapsNew,
          #tools.z3str3portfolio,
          #tools.z3str3portfolioNoProbe,
          #tools.z3str3portfolioNoProbe2,
          #tools.z3str3portfolioNoProbe3,
          #tools.z3str3bv,
          #tools.z3str3portfolio2,
          #tools.z3str2,
          #tools.z3str3length,
          #tools.woorpjeSMT
          #tools.trau,
          #tools.dummy
]:
    s.addRunner (solvers)
#tools.woorpje_heuristics.addRunners ("variableTermRatio",smtsolvers,3.14,solvers)

summaries = [summarygenerators.terminalResult
]
timeout = 20 
ploc = utils.JSONProgramConfig ()

store = storage.SQLiteDB ("new_z3_run_pyex_all")
summaries = [
    summarygenerators.terminalResult,
    store.postTrackUpdate
]
#verifiers = {"cvc4": tools.cvc4,"z3seq" : tools.z3seq} # use cvc4 and the sequence solver as verifiers
verifiers = ["cvc4","z3seq"]
#verifiers = []
testrunner().runTestSetup (tracks,solvers,voting.MajorityVoter(),summaries,store,timeout,ploc,verifiers)
startwebserver.Server (store.getDB ()).startServer ()
