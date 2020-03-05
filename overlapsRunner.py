#!/usr/bin/python

from runners.multi import TheRunner as testrunner
import utils
import storage
import voting.majority as voting
import tools.z3seq
import tools.z3str3
import tools.z3str4
import tools.cvc4

import models.woorpje
import models.kaluza
import models.PyEx
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
import startwebserver

import summarygenerators
tracks = (models.PyEx.getTrackData () +
          models.pisa.getTrackData ("Pisa") +
          models.nornbenchmarks.getTrackData ("Norn") +
          models.light.getTrackData("Trau Light")+
          models.Leetcode.getTrackData ("Leetcode Strings") + 
          models.appscan.getTrackData ( "IBM Appscan") + 
          models.slothtests.getTrackData ("Sloth") +
          models.woorpje.getTrackData ("Woorpje Word Equations") +
          models.kaluza.getTrackData ("Kaluza") +
          models.stringfuzz.getTrackData ("StringFuzz") +
          models.z3_regression.getTrackData("z3Str3 Regression")+
          models.cashewsuite.getTrackData ("Cashew") + 
          models.joacosuite.getTrackData ("JOACO") +
          models.strangersuite.getTrackData ("Stranger") +
          models.kauslersuite.getTrackData ("Kausler") +
          models.banditfuzz.getTrackData("BanditFuzz") +
        []
        )

solvers = {}
for s in [tools.z3seq,
          tools.z3str3,
          tools.cvc4,
          tools.z3str4,
]:
    s.addRunner (solvers)

summaries = [summarygenerators.terminalResult
]
timeout = 20 
ploc = utils.JSONProgramConfig ()

store = storage.SQLiteDB ("z3str4_final")
summaries = [
    summarygenerators.terminalResult,
    store.postTrackUpdate
]
verifiers = {"cvc4": tools.cvc4,"z3seq" : tools.z3seq} # use cvc4 and the sequence solver as verifiers
#verifiers = dict()
testrunner().runTestSetup (tracks,solvers,voting.MajorityVoter(),summaries,store,timeout,ploc,verifiers)
startwebserver.Server (store.getDB ()).startServer ()
