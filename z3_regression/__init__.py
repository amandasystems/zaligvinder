import os 
dir_path = os.path.dirname(os.path.realpath(__file__))

filest = []
filesteq = []
for root, dirs, files in os.walk(dir_path, topdown=False):
    for name in files:
        if name.endswith (".smt2"):
            filest.append(os.path.join (root,name))
        if name.endswith (".eq"):
            filesteq.append(os.path.join (root,name))
        
trackdata = ("z3-regression",filest)
trackdataeq = ("z3-regression",filesteq)
