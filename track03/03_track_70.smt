(set-logic QF_S)
(declare-fun H () String)
(declare-fun K () String)
(declare-fun I () String)
(declare-fun F () String)
(declare-fun E () String)
(declare-fun G () String)
(declare-fun M () String)
(assert (= (str.++  H "a" F H "a" H "a" F H "b" I K "b" K)  (str.++  "a" G E H K H K "b" M M "baa") ))
(check-sat)
(get-model)
