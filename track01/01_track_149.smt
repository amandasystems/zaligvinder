(set-logic QF_S)
(declare-fun G () String)
(declare-fun E () String)
(declare-fun A () String)
(declare-fun J () String)
(assert (= (str.++  "e" J "jc" A "h")  (str.++  "ef" E G) ))
(check-sat)
(get-model)
