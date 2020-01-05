(set-logic QF_S)
(declare-fun I () String)
(declare-fun D () String)
(declare-fun H () String)
(assert (= (str.++  D "acbddbcfaeddcdea" I "cebfddeccffeede")  (str.++  "bfaacbddbcfae" H "cebfddeccffeede") ))
(assert (= (str.++  "eecafabeacefbdefbafdfeabaeaecebafdcebfab" "")  (str.++  "eecafabeacefbdefbafdfeabaeaecebafdce" D "b") ))
(assert (= (str.++  "ebceabbddaadbfcaef" D "fcfeeaccabfafeaaeaf")  (str.++  "ebceabbddaadbfcaef" D "fcfeeacca" D "feaaeaf") ))
(assert (>=(* (str.len D) 4) 4))
(assert (<=(* (str.len D) 20) 400))
(check-sat)
(get-model)