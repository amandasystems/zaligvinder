import matplotlib.pyplot as plt
from itertools import accumulate
import tabulate
import json

def terminalResult (name,res):
    print ("Track:" + name)
    table = []
    ref = correctReferenceList (name,res)
    for n in res.keys():
        sat = sum([1 for i in res[n] if True == i[0]])
        nsat = sum([1 for i in res[n] if False == i[0]])
        unk = sum([1 for i in res[n] if None == i[0]])
        t = sum([i[1] for i in res[n] ])
        #twto = sum([i[1] for i in res[n] if not i[2] ])
        cort = sum([i[0][1] for i in zip([(j[0],j[1]) for j in res[n]],ref) if i[0][0] == i[1] and i[1] != None])
        errors = sum([1 for i in zip([j[0] for j in res[n]],ref) if i[0] != i[1] and i[1] != None and i[0] != None])
        table.append ([n,sat,nsat,unk,errors,t,cort])
    print(tabulate.tabulate(table,["Solver", "Satis", "NSatis", "Unknown", "Errors", "Total Time", "Total Correct"]))

def cactusPlot (name,res):
    for p in res.keys():
        data = [i[1] for i in res[p]]
        data.sort()
        data = list(accumulate(data))                       
        plt.scatter (range(0,len(data)),data,label = p)

    plt.title (name)
    plt.legend (loc='upper left')
    plt.savefig ("{0}-cactus.png".format(name))
    plt.close()

def correctReferenceList (name,res):
    ref = []
    for elem in zip (*res.values()):
        sat = sum([1 for i in elem  if i[0]])
        nsat = sum([1 for i in elem if i[0] == False])
        if sat > 0 and sat > nsat:
            ref.append(True)
        elif nsat > 0 and nsat > sat:
            ref.append(False)
        else:
            ref.append(None)
    return ref
            
class JSONOutputter:
    def __init__(self):
        self._data = []

    def __call__ (self,name,res):
        self._data.append((name,res))
    
    def writeout (self):
        f = open ("fff",'w')
        json.dump (self._data,f)    
        
def timePlot (name,res):
    pass
