(set-logic QF_S)
(declare-fun B () String)
(declare-fun E () String)
(declare-fun C () String)
(assert (= (str.++  "dgcfachbfadadbcbedchiabgd" E "ecdbbbicefadie")  (str.++  "dgcfa" B "adbcbedchi" C "bbbicefadie") ))
(check-sat)
(get-model)
