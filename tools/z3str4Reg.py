import subprocess
import tempfile
import os
import shutil
import utils
import sys
import timer


#path = utils.findProgram ("Z3BINARY","z3")

def run(eq,timeout,ploc,wd): #(params,eq,timeout,ploc,wd):
    path = ploc.findProgram ("Z3str4Reg")
    if not path:
        raise "Z3 Not in Path"

    tempd = tempfile.mkdtemp ()
    smtfile = os.path.join (tempd,"out.smt")
    #tools.woorpje2smt.run (eq,smtfile,ploc)

    # hack to get rid of (get-model), not needed for z3 and returns 1 / Error if input is unsat
    f=open(eq,"r")
    copy=open(smtfile,"w")
    for l in f:
        if "(get-model)" not in l:
            copy.write(l)
    
    f.close()
    copy.close() 

    time = timer.Timer ()
    try:
        out = subprocess.check_output ([path]+["smt.string_solver=z3str3","smt.str.tactic=regex","smt.str.search_overlaps=true","smt.arith.solver=2"]+["dump_models=true",smtfile],timeout=timeout).decode().strip()
        #out = subprocess.check_output ([path]+params+["dump_models=true",smtfile],timeout=timeout).decode().strip()
            

    except subprocess.TimeoutExpired:
        return utils.Result(None,timeout,True,1)
    
    except subprocess.CalledProcessError as e:
        
        print(eq)
        time.stop()
        out = "Error in " + eq + ": " + str(e)
        return utils.Result(None,time.getTime(),False,1,out)

    time.stop()    
    
    if "NOT IMPLEMENTED YET!" in out and not time >= timeout:
        out = "Error in " + eq + ": " + out    

    shutil.rmtree (tempd)
    if "unsat" in out:
        return utils.Result(False,time.getTime (),False,1,out)
    elif "sat" in out:
        return utils.Result(True,time.getTime(),False,1,out,"\n".join(out.split("\n")[1:]))
    elif time.getTime() >= timeout:
        return utils.Result(None,timeout,True,1)
    return utils.Result(None,time.getTime  (),False,1,out)

def addRunner (addto):
    #addto['z3str4FSE'] = run
    from functools import partial
    params = { #"arr" : ["smt.string_solver=z3str3","smt.str.tactic=arr","smt.arith.solver=2"],
               #"las" : ["smt.string_solver=z3str3","smt.str.tactic=las","smt.arith.solver=2"],
               #"seq" : ["smt.string_solver=seq","smt.arith.solver=2"],
               #"static-choice" : ["smt.string_solver=z3str3","smt.str.tactic=all","smt.arith.solver=2"],
               #"no-overlaps" : ["smt.string_solver=z3str3","smt.str.tactic=z3str4","smt.arith.solver=2"],
               #"no-overlaps-len-default" : ["smt.string_solver=z3str3","smt.str.tactic=z3str4"],
               "overlaps" : ["smt.string_solver=z3str3","smt.str.tactic=z3str4","smt.str.search_overlaps=true","smt.arith.solver=2"] 
            }

    for i in params.keys():
        addto['z3str3-RegEx'] = run #partial(run,params[i])

if __name__ == "__main__":
    print(run (sys.argv[1],None))

