(set-logic QF_S)
(declare-fun I () String)
(declare-fun K () String)
(declare-fun H () String)
(declare-fun R () String)
(declare-fun L () String)
(declare-fun O () String)
(declare-fun M () String)
(declare-fun P () String)
(assert (= (str.++  I "aaaaaa" I "aaaaab" K "a" I K "b" L O "b" P)  (str.++  "a" H "aa" L I L I "b" M M "b" R R "baa") ))
(check-sat)
(get-model)