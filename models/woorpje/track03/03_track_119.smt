(set-logic QF_S)
(declare-fun N () String)
(declare-fun E () String)
(declare-fun J () String)
(declare-fun H () String)
(declare-fun K () String)
(declare-fun F () String)
(declare-fun L () String)
(declare-fun Q () String)
(assert (= (str.++  E F "aa" E F "ab" L K "b" N)  (str.++  "a" H E K J K J "b" Q Q "baa") ))
(check-sat)
(get-model)