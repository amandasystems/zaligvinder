(set-logic QF_S)
(declare-fun H () String)
(declare-fun G () String)
(declare-fun E () String)
(declare-fun A () String)
(assert (= (str.++  E H A E E H "a")  (str.++  G G H A) ))
(check-sat)
(get-model)
