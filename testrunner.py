import tabulate
import os
import z3seq
import z3str3
import cvc4
import woorpje
import sys

timeout = 30

solvers = {'z3str3' : z3str3.run,
           'z3seq' : z3seq.run,
           'cvc4' : cvc4.run,
           'woorpje' :  woorpje.run
}

def progressMessage (track,file,solver,cur,total):
    sys.stdout.write ("\x1b[2K\r[ {0}  {1} {2} - {3}/{4}]".format(track,file,solver,cur+1,total))

def runTrack (dir,outputfile):
    results = {}
    for root,dirs,files in os.walk (dir):
        for i,name in enumerate(files):
            if name.endswith (".eq"):  
                for n,func in solvers.items():
                    progressMessage (root,name,n,i,len(files))
                    res, time = func (os.path.join (root,name),timeout)
                    outputfile.write ("{0},{1},{2},{3}\n".format (os.path.join (root,name),n,res,time))
                    outputfile.flush ()
                    results[n] = results.get(n,[]) + [(res,time)]
              
    return results


outputfile = open("res.cvs",'w')

table = []
for track in sys.argv[1:]:
    print ("Track:" + track)
    res = runTrack (track,outputfile)
    table = []
    for n in solvers.keys():
        sat = sum([1 for i in res[n] if True == i[0]])
        nsat = sum([1 for i in res[n] if False == i[0]])
        unk = sum([1 for i in res[n] if None == i[0]])
        t = sum([i[1] for i in res[n] ])
        
        table.append ([n,sat,nsat,unk,t])
    sys.stdout.write ("\n")
    print(tabulate.tabulate(table,["Solver", "Satis", "NSatis", "Unknown", "Total Time"]))
            

