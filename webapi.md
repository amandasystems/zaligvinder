# Starting the server
The server is started by running `python webtest sqlite.db`

## API 
- localhost:8081/tracks - json-formatted data about the tracks. THe data contains the name of the tracks, it's id and a list of all instances along with their ids
- localhost:8081/instances - json formatted data about instances. The instances contains their name and their ids
- localhost:8081/instances/{instanceid}/model.smt - the smt-file associated to this instance  (if accessible by the server)
- localhost:8081/results - json-formatted result data
- localhost:8081/results/{trackid} - json-formatted result for particular track
- localhost:8081/chart/cactus - json-formatted data for a cactus plot (solvers can be selected by adding a sequence of ?solver=solvername) 
- localhost:8081/chart/cactus?png=1 - generate an actual png image for cactus plot
- localhost:8081/solvers - solvernames used in the benchmark


