(set-logic QF_S)
(declare-fun B () String)
(declare-fun G () String)
(assert (= (str.++  B "")  (str.++  G "") ))
(check-sat)
(get-model)
