import os
import utils
dir_path = os.path.dirname(os.path.realpath(__file__))

filest = []
for root, dirs, files in os.walk(dir_path, topdown=False):
    for name in files:
        if name.endswith (".smt2") and not name.startswith("."):
            filest.append(utils.TrackInstance(name,os.path.join (root,name)))

trackdata = utils.Track("kaluze_woorpje",filest)
