(set-logic QF_S)
(declare-fun E () String)
(assert (= (str.++  "a" E "aa" E "ba")  (str.++  "a" E E E E "baa") ))
(check-sat)
(get-model)
