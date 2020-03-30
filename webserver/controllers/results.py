import webserver.views


class ResultController:
    def __init__(self,results,track):
        self._results = results
        self._track = track

    def getSummaryForSolver (self,params):
        res = {}
        #print (params)
        
        s = params["solver"]
        smtcalls,timeouted,satis,unk,nsatis,errors,time,instances = self._results.getSummaryForSolver (s)
        res["Summary"] = {
            'solver' : s,
            'smtcalls' : smtcalls,
            'timeouted' : timeouted,
            'satisfied' : satis,
            'not satisfied' :  nsatis,
            'error' : errors,
            'Unknown' : unk,
            'time' : "%.2f" % time,
            'instances' : instances
            }
        return webserver.views.jsonview.JSONView (res)

    def getSummaryForSolverTrack (self,params):
        res = {}
        
        s = params["solver"]
        track = int(params["track"])
        bgroup = params.get("bgroup",[""])[0]
        #print ("PPPP",track,bgroup)
        smtcalls,timeouted,satis,unk,nsatis,errors,time,instances = self._results.getSummaryForSolverTrack (s,track) if track != 0 else self._results.getSummaryForSolverGroup (s,bgroup)
        res["Summary"] = {
            'solver' : s,
            'smtcalls' : smtcalls,
            'timeouted' : timeouted,
            'satisfied' : satis,
            'not satisfied' :  nsatis,
            'error': errors,
            'Unknown' : unk,
            'time' : "%.2f" % time,
            'instances' : instances
            }
        return webserver.views.jsonview.JSONView (res)

    def getRanks(self,params):
        if "track" in params and int(params["track"]) != 0:
            data = self._results.getTrackInstancesClassification (params["track"])
        else:
            groups = list(self._results.getTrackInfo ().keys())
            if "bgroup" in params and params["bgroup"][0] in groups:
                bgroup = params["bgroup"][0]
            else:
                bgroup =  groups[0]
            data = self._results.getGroupInstancesClassification (bgroup)


        summaryData = dict()
        for iid in data:
            sortedData = sorted(data[iid], key=lambda tup: tup[4])
            for (solv,to,error,unk,time) in sortedData:
                i = 0
                if solv not in summaryData:
                    summaryData[solv] = 0

                # Points:
                # Timeouted: -1 point
                # Error: -5 Points
                # Unknown: 1 point
                # correct: 5 points / classification positon

                # stupid inlining :/
                if to:
                    summaryData[solv]-=1
                elif error:
                    summaryData[solv]-=5
                elif unk:
                    summaryData[solv]+=1
                else:
                    i+=1
                    summaryData[solv]+=(int(5/(i+1)))

        return webserver.views.jsonview.JSONView ([{"solver" : solv,
                                                    "points" : points,
                                                }
                                                   for solv, points in sorted(summaryData.items(), key=lambda item: item[1], reverse=True)])


    def getReferenceResult (self,params):
        ref = self._results.getReferenceForInstance (params["instance"])
        res = {'result' : ref.result,
               'satisfying solvers' : ref.satissolvers,
               'nsatisfying solvers' : ref.nsatissolvers
        }
        return webserver.views.jsonview.JSONView (res)
    
    def getAllResults (self,params):
        instances = self._results.getAllResults ()
        
        return webserver.views.jsonview.JSONView ([{"solver" : tt[0],
                                                    "instanceid" : tt[1],
                                                    "Result" : {
                                                        "smtcalls" : tt[2].smtcalls,
                                                        "timeouted" : tt[2].timeouted,
                                                        "result" : tt[2].result,
                                                        "time" : "%.2f" % tt[2].time}
                                                    }
                                                     for tt in instances])
    
    def getOutput (self,params):
        #print (params)
        instances = self._results.getOutputForSolverInstance (params["solver"],params["instance"])
        return webserver.views.TextView.TextView (instances)

    def getModel (self,params):
        #print (params)
        instances = self._results.getModelForSolverInstance (params["solver"],params["instance"])
        return webserver.views.TextView.TextView (instances)
    
    
    def getTrackResults (self,params):
        if "track" in params:
            assert(len(params) == 1)
            instances = self._results.getTrackResults (params["track"])
            return webserver.views.jsonview.JSONView ([{"solver" : tt[0],
                                                        "instanceid" : tt[1],
                                                        "Result" : {
                                                            "smtcalls" : tt[2].smtcalls,
                                                            "timeouted" : tt[2].timeouted,
                                                            "result" : tt[2].result,
                                                        "time" : "%.2f" % tt[2].time}
                                                    }
                                                       for tt in instances])
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})
        
    def getSolvers (self,params):
        return webserver.views.jsonview.JSONView (self._results.getSolvers ())

    def getInstanceIdsForTrack(self,params):
        if "track" in params:
            assert(len(params) == 1)
            instances = self._results.getInstanceIdsForTrack (params["track"])
            return webserver.views.jsonview.JSONView ([{"id" : tt[0]} for tt in instances])
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})

    def getInstanceIdsForGroup(self,params):
        if "bgroup" in params:
            assert(len(params) == 1)
            instances = self._results.getInstanceIdsForGroup (params["bgroup"])
            return webserver.views.jsonview.JSONView ([{"id" : tt[0]} for tt in instances])
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})

    def getTrackInfo(self,params):
        return webserver.views.jsonview.JSONView (self._results.getTrackInfo ()) 

    def _mapResultToIcon(self,result):
        iconMap = {0 : "times", 1 : "check", None : "unknown-status"}
        if result in iconMap:
            return iconMap[result]
        else:
            return "exclamation-triangle"


    def _conjunctivesAUX(self,results,solvers,unknowns=set()):
        best_count = dict()
        instance_count = len(results[list(results.keys())[0]])
        for s in solvers:
            best_count[s] = 0 # []

        i = 0
        for iid in results[list(results.keys())[0]]:
            best = (None,None,20.0)
            for s in results.keys():
                thisResult = results[s][iid][0]
                thisTime = results[s][iid][1]
                thisFile = results[s][iid][2]

                if best[0] == None or (thisResult != None and thisTime < best[2]):
                    best = (s,thisResult,thisTime)


            if iid in unknowns:
                i+=1
                print(i)

            if best[1] != None: # and iid in unknowns:
                #best_count[best[0]]+=[thisFile]
                best_count[best[0]]+=1
        print("LOLX : " +str(len(unknowns)))
        return (best_count,instance_count)

    def _getNewFileName(self,f):
        f = f[len("/home/mku/wordy/models/"):]
        return "".join(["_"+x for x in f.split("/")])[1:]



    def conjunctives(self,params):
        (conTrue,conFalse,conNone) = self._results.groupFilesByConjunctives()

        print("----------")
        print("mkdir probe_true probe_false probe_unknown")
        for f in conTrue:
            print("cp " + f + " ./probe_true/"+self._getNewFileName(f))
        for f in conFalse:
            print("cp " + f + " ./probe_false/"+self._getNewFileName(f))
        for f in conNone:
            print("cp " + f + " ./probe_unknown/"+self._getNewFileName(f))



        # /home/mku/wordy/models/ -- cp to SetName_TrackName_InstanceName.smt

        print("........")


        return webserver.views.jsonview.JSONView({})
        conTrue,conFalse,conNone,total = 0,0,0,0
        for bgroup in list(self._results.getTrackInfo ().keys()):
            tup = self._results.getConjunctiveInfoPerGroup(bgroup)
            conTrue+=tup[0]
            conFalse+=tup[1]
            conNone+=tup[2]
            total+=tup[3]

        probe_true_failed = 0
        probe_false_failed = 0
        unknown_not_classified = 0

        ### get all unknown instances
        print("----------")
        print("mkdir probe_true probe_false probe_unknown_not_classified")

        for bgroup in list(self._results.getTrackInfo ().keys()):
            for t in self._results.getConjunctiveInfoPerSolverGroupClassifiedInstances("z3str4",bgroup,True,True):
                print("cp " + t[2] + " ./probe_true/")
                probe_true_failed+=1

            for t in self._results.getConjunctiveInfoPerSolverGroupClassifiedInstances("z3str4",bgroup,False,True):
                print("cp " + t[2] + " ./probe_false/")
                probe_false_failed+=1

            for t in self._results.getConjunctiveUnknownInstances("z3str4",bgroup,True):
                print("cp " + t + " ./probe_unknown_not_classified/")

        data = { "total" : total, "true" : conTrue, "false" : conFalse, "unknown" : conNone, "Unknown_probe_true" : probe_true_failed, "Unknown_probe_false" : probe_false_failed}
        
        
        return webserver.views.jsonview.JSONView (data) 



        #
        solvers = ["z3seq","len-abs"]
        group = list(self._results.getTrackInfo ().keys())[0]
        results_true,results_false = self._results.splitSolverToProbe(solvers)
        results = {"Probe_True" : results_true, "Probe_False" : results_false}

        unknowns_z3str4 = self._results.getAllUnknownsForSolver("z3str4-fse")


        data = dict()
        for r in results.keys():
            data[r] = dict()
            best_count,instances_count = self._conjunctivesAUX(results[r],solvers,unknowns_z3str4)
            data[r]["instances"] = instances_count
            data[r]["solvers"] = best_count

        """
            for k in data:
                for f in data[k]:
                    print("cp " + f + " ./" + k + "/")




        for bgroup in list(self._results.getTrackInfo ().keys()):
            for t in self._results.getConjunctiveInfoPerSolverGroupClassifiedInstances("z3str4",bgroup,False,False):
                totalClassified+=1
        """

        """
        ff = "probe_true_solved_by_other_arm"

        print("mkdir " + ff)

        for t in self._results.getAllInstancesForSolverTrackResult(["z3str4-false","z3seq","z3str4-true"],2):
            print("cp " + t + " ./" + ff + "/")

        """


        return webserver.views.jsonview.JSONView (data) 

    def getResultForSolvers(self,params):
        if "solvers" in params and "instance" in params:
            iid = params["instance"]
            results = self._results.getInstanceResultForSolvers(iid,params["solvers"])
            data = dict()
            data[iid] = dict()
            resultSet = False
            expectedResult = None
            expectedResultSet = False
            instanceName = ""
            errorFound = 0
            classifications = []
            answers = [0,0]

            for tt in results:
                if expectedResult == None and not expectedResultSet:   
                    expectedResult = tt[2]   
                    if expectedResult != None:
                        expectedResultSet = True
                    instanceName = tt[3]
                error = 1 if ((expectedResult != tt[4].result and expectedResultSet) or (tt[4].result == True and tt[4].verified == False)) and tt[4].result != None else 0
                programError = 1 if "Error" in tt[5] else 0

                errorFound = 1 if error == 1 or errorFound == 1 else 0
                data[iid][tt[0]] = { "smtcalls" : tt[4].smtcalls,
                                     "timeouted" : tt[4].timeouted,
                                     "result" : tt[4].result,
                                     "icon" : self._mapResultToIcon(tt[4].result),
                                     "time" : "%.2f" % tt[4].time,
                                     "error" : error,
                                     "unique_answer" : 0,
                                     "programError" : programError,
                                     "verified" : tt[4].verified}
                if tt[4].result != None and error == 0:
                    classifications+=[tt[0]]
                    if tt[4].result == 1:
                        answers[0]+=1
                    else:
                        answers[1]+=1

            if len(classifications) == 1 and expectedResult != None and errorFound == 0:
                data[iid][classifications[0]]["unique_answer"] = 1

            if answers[0] == answers[1] and answers[0] > 0:
                data[iid]["ambiguous_answer"] = 1
            else: 
                data[iid]["ambiguous_answer"] = 0


            data[iid]["expected"] = expectedResult
            data[iid]["unique"] = 1 if len(classifications) == 1 and errorFound == 0 else 0
            data[iid]["error"] = errorFound  
            data[iid]["name"] = instanceName                      
            data[iid]["unknown"] = 1 if len(classifications) == 0 else 0

            return webserver.views.jsonview.JSONView (data)
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})


    def getAllErrorsForSolver(self,params):
        if "solver" in params:
            solvers = [params["solver"][0]]
        else:
            solvers = self._results.getSolvers()


        bgroups = list(self._results.getTrackInfo ().keys())

        data = dict()

        for solver in solvers:
            invalidModel = []
            programError = []
            wrongUnsat = []
            for bgroup in bgroups:
                results = self._results.getErrosForSolverGroup(solver,bgroup)
                for (s,g,tname,instance,filepath,t,res,exp,model,verified,output) in results:
                    if verified == False:
                        invalidModel+=[filepath]
                    elif res != exp and res != None:
                        wrongUnsat+=[filepath]
                    elif "Error" in output:
                        #print(t,res)
                        #print(output)
                        if "SIG" in output:
                            test = output.split("died with")

                            import ntpath
                            print(ntpath.basename(filepath),test[len(test)-1])

                            programError+=[filepath]
                    else:
                        pass
                    #raise Exception("This point should never be reached!")
            data[solver] = {"invalidModel" : invalidModel,"wrongUnsat" : wrongUnsat,"programError" : programError}

        # hack
        """
        print("----------")
        print("mkdir invalidModel wrongUnsat programError")
        for k in data:
            for f in data[k]:
                print("cp " + f + " ./" + k + "/")
        """
        
        #return data
        return webserver.views.jsonview.JSONView (data)

    def quickHack(self,params):
        dataSeq = self.getAllErrorsForSolver({"solver" : ["z3seq"]})
        dataStr = self.getAllErrorsForSolver({"solver" : ["z3str4-overlaps"]})


        for k in dataStr:
            for filepath in dataStr[k]:
                if filepath not in dataSeq[k]:
                    print(filepath)
                else:
                    pass
                    #print("LOL")

        print("----------")
        print("mkdir invalidModel wrongUnsat programError")
        for k in dataStr:
            for f in dataStr[k]:
                if f not in dataSeq[k]:
                    print("cp " + f + " ./" + k + "/")

        return webserver.views.jsonview.JSONView ("")           


    def getBestSolverForStringOperations(self,params):
        benchmarkInfo = self._results.getTrackInfo ()
        keyWordLimit = 3
        # keywords -> solver -> occurence
        solverStats = dict()
        for g in benchmarkInfo.keys():
            for (tid,tname) in benchmarkInfo[g]:
                print("Track :" + str(tid) + " - " + tname)
                for instanceid in self._results.getInstanceIdsForTrack(tid):
                    #print("Instance id:" + str(instanceid))
                    s = self._results.getBestSolverForInstance(instanceid)
                    if s != None:
                        distributionList = [k[0] for k in sorted(self._track.getStringOperationDataForInstance(instanceid).items(), key = lambda kv:(kv[1], kv[0]))]
                        distributionList.reverse()
                        distributionList = distributionList[:keyWordLimit]
                        distributionList.sort()

                        kt = tuple(distributionList)

                        if kt not in solverStats:
                            solverStats[kt] = dict() 

                        if s not in solverStats[kt]:
                            solverStats[kt][s]=1
                        else:
                            solverStats[kt][s]+=1


        for kt in solverStats:
            print("KeyWords: " + str(kt))
            for s in solverStats[kt]:
                print(s + ": " + str(solverStats[kt][s]))
            print("------")


        return webserver.views.jsonview.JSONView ("")
    
    def getFasterClassifiedInstancesForTrack(self,params):
        if "solvers" in params and "track" in params and len(params["solvers"]) == 2:
            solver1 = params["solvers"][0]
            solver2 = params["solvers"][1]
            #trackid = params["track"][0]
           #bgroup = list(self._results.getTrackInfo ().keys())[0]
            groups = self._results.getTrackInfo ()

            out = ""

            for bgroup in groups: 
                out= "=== "+str(bgroup)+"\n"
                for (trackid,tname) in groups[bgroup]:
                    out+= "==== "+str(tname)+"\n"
                    data = self._results.getArmsHack(trackid) #self._results.get2ComparisonTrackResultsFasterClassified(trackid,solver1,solver2)
                    #out+='''|===\n|Instance |Timeout ''' + str(solver1) + ''' |Timeout ''' + str(solver2) + ''' | Time ''' + str(solver1) + ''' |Time ''' + str(solver2) + '''\n'''
                    out+='''|===\n|Instance |Timeout z3str3-portfolio |Time z3str3-portfolio |Other Solver |Timeout |Time |Deepest Nesting |Block # |Variables #| Symbols # \n'''
                    for iid in data:
                        #(solv,to,error,unk,time) = data[iid][0]
                        solver1Data = data[iid][0]
                        solver2Data = data[iid][1]
                        nesting = 0
                        blocks = 0
                        symbols = ""
                        variables = ""

                        # post processing 
                        for (k,v) in data[iid][2]:
                            if k == "deepest_nest":
                                nesting = v
                            elif k == "(":
                                blocks = v
                            elif k in ["Int","String","Bool"]:
                                variables+=k+" ("+str(v)+"), "
                            else:
                                symbols+=k+" ("+str(v)+"), "


                        #if solver1Data[0] ==  solver1:
                        out+="|{}|{}|{:.2f}|{}|{}|{:.2f}|{}|{}|{}|{}\n".format(self._results.getInstanceNameToId(iid),solver1Data[1],solver1Data[4],solver2Data[0],solver2Data[1],solver2Data[4],nesting,blocks,variables,symbols)

                    out+="|===\n\n"     
                print(out)


            return webserver.views.jsonview.JSONView ("")
        else:
            return webserver.views.jsonview.JSONView ({"Error" : "Missing parameter"})










