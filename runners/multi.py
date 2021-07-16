import sys
import utils
import tempfile
import shutil
import logging

import verification.verifier

from multiprocessing import Pool
from multiprocessing import current_process

logger = logging.getLogger(__name__)


def progressMessage(file, solver):
    sys.stdout.write(
        "\x1b[2K[ {0} -  {1} | {2} ]\r".format(file.name, solver, current_process().pid)
    )


def runSpecific(tup):
    logging.debug("Running job %s", tup)
    try:
        solvername, func, model, timeout, ploc, verifiers = tup
        progressMessage(model, solvername)
        tempd = tempfile.mkdtemp()
        result = func(model.filepath, timeout, ploc, tempd)

        # verification goes here
        v = verification.verifier.Verifier()
        if result.result == True:
            result = v.verifyModel(result, ploc, model.filepath, timeout, verifiers)

        shutil.rmtree(tempd)
        return result
    except Exception as e:
        logger.exception("Error while running experiments: ", e)
        shutil.rmtree(tempd)
        return utils.Result(None, timeout, True, 0, str(e))

class TheRunner:
    def __init__(self, cores=None):
        self._cores = cores

    def runTrack(self, track, solvers, store, timeout, ploc, verifiers=[]):
        logger.info("running track %s", track)
        results = {}

        tasks = []
        for solver, func in solvers.items():
            for n in track.instances:
                tasks.append((solver, func, n, timeout, ploc, verifiers))

        logger.info("Scheduled %d tasks", len(tasks))

        with Pool(self._cores) as p:
            res = p.map(runSpecific, tasks)
        res = []

        for setting, result in zip(tasks, res):
            solvername, model = setting[0], setting[2]
            store.writeData(track, model, solvername, result)
            results[solvername] = results.get(solvername, []) + [result]

        return results

    def runTestSetup(
        self,
        tracks,
        solvers,
        voter,
        summaries,
        outputfile,
        timeout,
        ploc,
        verifiers=dict(),
    ):
        for t in tracks:
            res = self.runTrack(t, solvers, outputfile, timeout, ploc, verifiers)
            voter.voteOnResult(t, res, verifiers)
            for s in summaries:
                s(t, res)