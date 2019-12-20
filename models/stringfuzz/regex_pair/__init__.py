import os
dir_path = os.path.dirname(os.path.realpath(__file__))

filest = []
filesteq = []
for root, dirs, files in os.walk(dir_path, topdown=False):
    for name in files:
        if name.endswith (".smt20") or name.endswith (".smt25") or name.endswith (".smt2") or name.endswith (".smt"):
            filest.append(os.path.join (root,name))
        if name.endswith (".eq"):
            filesteq.append(os.path.join (root,name))

trackdata = ("z3-regex-pair",filest)
trackdataeq = ("z3-regex-pair",filesteq)
