import os
import utils
dir_path = os.path.dirname(os.path.realpath(__file__))

filest = []
filesteq = []
for root, dirs, files in os.walk(dir_path, topdown=False):
    for name in files:
        if name.endswith (".smt20") or name.endswith (".smt25") or name.endswith (".smt2") or name.endswith (".smt"):
            filest.append(utils.TrackInstance(name,os.path.join (root,name)))

trackdata = utils.Track("z3-concats-big",filest)
