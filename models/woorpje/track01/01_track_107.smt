(set-logic QF_S)
(declare-fun I () String)
(declare-fun B () String)
(declare-fun C () String)
(assert (= (str.++  "dabcfdcadfaccfccdbb" B C "cbeddebceedfdbaccdfeeaebeecaecddbeaced")  (str.++  "dabcfdcadfaccf" I "dfdbaccdfeeaebeecaecddbeaced") ))
(check-sat)
(get-model)