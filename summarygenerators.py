import matplotlib.pyplot as plt
from itertools import accumulate
import tabulate

def terminalResult (name,res):
    print ("Track:" + name)
    table = []
    for n in res.keys():
        sat = sum([1 for i in res[n] if True == i[0]])
        nsat = sum([1 for i in res[n] if False == i[0]])
        unk = sum([1 for i in res[n] if None == i[0]])
        t = sum([i[1] for i in res[n] ])
        twto = sum([i[1] for i in res[n] if not i[2] ])
        
        table.append ([n,sat,nsat,unk,t,twto])
    print(tabulate.tabulate(table,["Solver", "Satis", "NSatis", "Unknown", "Total Time", "Total Without timeout"]))

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

def timePlot (name,res):
    pass
