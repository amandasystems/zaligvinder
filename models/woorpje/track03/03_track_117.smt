(set-logic QF_S)
(declare-fun H () String)
(declare-fun K () String)
(declare-fun I () String)
(declare-fun G () String)
(declare-fun E () String)
(declare-fun F () String)
(assert (= (str.++  E E E E "a" E E E E "b" G "ab" K)  (str.++  "a" F "a" E E H G H G "b" I I "baa") ))
(check-sat)
(get-model)