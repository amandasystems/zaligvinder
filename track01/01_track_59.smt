(set-logic QF_S)
(declare-fun D () String)
(declare-fun G () String)
(declare-fun J () String)
(assert (= (str.++  "bbeeeaefaddddcfdb" J "e")  (str.++  "bbeeeaefaddddcfd" G "e" D "fedfdcbccfccadacbaaffcffbce") ))
(check-sat)
(get-model)
