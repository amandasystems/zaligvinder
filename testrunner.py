import tabulate
import os
import z3seq
import z3str3
import sys

timeout = 30

solvers = {'z3str3' : z3str3.run,
           'z3seq' : z3seq.run
}

def progressMessage (track,file,solver):
    sys.stdout.write ("\x1b[2K\r[ {0}  {1} {2} ]".format(track,file,solver))
    
outputfile = open("res.cvs",'w')
for root, dirs, files in os.walk(".", topdown=False):
    
    sats = {}
    nsats = {}
    unknown = {}
    times = {}
    for name in files:
      if name.endswith (".eq"):  
          for n,func in solvers.items():
              progressMessage (root,name,n)
              res, time = func (os.path.join (root,name),timeout)
              outputfile.write ("{0},{1},{2},{3}\n".format (os.path.join (root,name),n,res,time))
              outputfile.flush ()
              times[n] = times.get (n,[])+[time or timeout]
              if res:
                  sats[n] = sats.get(n,0) + 1
              elif res == False:
                  nsats[n] = nsats.get(n,0) +1
              else:
                  unknown[n] = unknown.get(n,0) +1
    sys.stdout.write ("\n")              

    table = []
    print ("Track:" + root)
    for n in solvers.keys():
        table.append ([n,sats.get(n,0),nsats.get(n,0),unknown.get(n,0),sum(times.get(n,[]))]
        )
    print(tabulate.tabulate(table,["Solver", "Satis", "NSatis", "Unknown", "Total Time"]))
            

