(set-logic QF_S)
(declare-fun F () String)
(declare-fun E () String)
(declare-fun D () String)
(assert (= (str.++  "aecfddedeeb" E "dbcaedadcabceffcffecfbcbfabccbedfdfbeec")  (str.++  "aecf" F "ebaebbcbbbaccfacdcdaccbfcbaa" D "dfbeec") ))
(check-sat)
(get-model)
