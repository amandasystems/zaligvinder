import os 
import utils
dir_path = os.path.dirname(os.path.realpath(__file__))

def getTrackData (bname = None):
    filest = []
    for root, dirs, files in os.walk(dir_path, topdown=False):
        for name in files:
            if name.endswith (".smt2"):
                filest.append(utils.TrackInstance(name,os.path.join (root,name)))
    return [utils.Track("z3-regression",filest,bname)]
