(set-logic QF_S)
(declare-fun I () String)
(declare-fun E () String)
(declare-fun A () String)
(assert (= (str.++  "b" E "adcbbdbdddbabdca")  (str.++  "bbbdaaaa" A "cbd" A "d" I "dbdddbabdca") ))
(check-sat)
(get-model)
