(set-logic QF_S)
(declare-fun I () String)
(declare-fun B () String)
(declare-fun A () String)
(declare-fun C () String)
(assert (= (str.++  "feacebbddffac" C "fcafbadf")  (str.++  "feacebbddffacebb" A "afbadf") ))
(assert (= (str.++  "c" C "dbeee" C "eaaebc" C "ca" C "cb" A "effabdaebeafaf")  (str.++  "cbd" C "ee" B "aaebc" C "cabc" C I "afaf") ))
(assert (= (str.++  "ecabedccefbfedfefc" C "bdeceeddd" C "cdbdeeda" C "a" C)  (str.++  "ecabedccef" C "fedfefcb" C "deceeddd" C "cd" C "deeda" C "ab") ))
(assert (= (str.++  "dddedaedd" C "cadff" C "aadefea" C "eeacd" C "edbdf" C C "eff")  (str.++  "dddedaedd" C "cadffbaadefeabeeacd" C "ed" C "df" C C "eff") ))
(assert (<=(* (str.len C) 6) 108))
(assert (>=(* (str.len B) 14) 42))
(assert (>=(* (str.len I) 3) 9))
(assert (<=(* (str.len I) 11) 2948))
(check-sat)
(get-model)
