import os
import utils
dir_path = os.path.dirname(os.path.realpath(__file__))

def getTrackData (bname = ""):
    filest = []
    filesteq = []
    for root, dirs, files in os.walk(dir_path, topdown=False):
        for name in files:
            if name.endswith (".smt"):
                filest.append(utils.TrackInstance(name,os.path.join (root,name)))
        
    return [utils.Track("Track 5",filest,bname)]
