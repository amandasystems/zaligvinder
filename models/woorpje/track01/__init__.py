import os 
import utils
dir_path = os.path.dirname(os.path.realpath(__file__))

filest = []
filesteq = []
for root, dirs, files in os.walk(dir_path, topdown=False):
    for name in files:
        if name.endswith (".smt"):
            filest.append(utils.TrackInstance(name,os.path.join (root,name)))
        if name.endswith (".eq"):
            filesteq.append(utils.TrackInstance(name,os.path.join (root,name)))
        
trackdata = utils.Track("track1",filest)
trackdataeq = utils.Track("track1",filesteq)
