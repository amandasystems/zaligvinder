(set-logic QF_S)
(declare-fun F () String)
(declare-fun B () String)
(declare-fun D () String)
(declare-fun A () String)
(assert (= (str.++  B D D "aa" D "aa" D D "aa" A A D "aaaaaa" D D "aa" D D D "aaaa" D "aa" D D "aaaaa")  (str.++  F F F F "a") ))
(check-sat)
(get-model)
