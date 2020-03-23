#!/usr/bin/python

from runners.multi import TheRunner as testrunner
import utils
import storage
import voting.majority as voting
import tools.z3seq
import tools.z3str3
import tools.cvc4
import tools.woorpje
import models.woorpje.track01

import models.woorpje
#import models.kaluza
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

import models.kaluza.kaluzaWoorpje
import models.stringfuzzWoorpje
import models.woorpje
import models.woorpjeTest

import summarygenerators
tracks = (
          #models.stringfuzzWoorpje.getTrackData("StringFuzz") + 
          #models.kaluza.kaluzaWoorpje.getTrackData ("Kaluza") +
          models.woorpje.getTrackData ("Woorpje Word Equations") +
        []
        )

solvers = {}
for s in [tools.z3seq,
          tools.z3str3,
          tools.cvc4,
          tools.woorpje
]:
    s.addRunner (solvers)

summaries = [summarygenerators.terminalResult
]
timeout = 30 
ploc = utils.JSONProgramConfig ()

store = storage.SQLiteDB ("Woorpje")
summaries = [
    summarygenerators.terminalResult,
    store.postTrackUpdate
]
verifiers = ["cvc4","z3seq"] # use cvc4 and the sequence solver as verifiers
#verifiers = dict()
testrunner().runTestSetup (tracks,solvers,voting.MajorityVoter(),summaries,store,timeout,ploc,verifiers)
startwebserver.Server (store.getDB ()).startServer ()
