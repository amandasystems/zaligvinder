import os 
dir_path = os.path.dirname(os.path.realpath(__file__))

filest = []
for root, dirs, files in os.walk(dir_path, topdown=False):
    for name in files:
        if name.endswith (".smt"):
            filest.append(os.path.join (root,name))

trackdata = ("kaluze_simple",filest)
