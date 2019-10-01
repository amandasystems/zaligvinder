(set-logic QF_S)
(declare-fun I () String)
(declare-fun H () String)
(declare-fun F () String)
(declare-fun E () String)
(assert (= (str.++  "efadc" E "ebcecedeaabfcbfadfdcf")  (str.++  "efadcfdcafd" I "ce" F "aabfcbfadfdcf") ))
(assert (= (str.++  "fbcccbdefcfdaaffbeafbdfaf" H "abababdeef")  (str.++  "fbcccbdefcfdaaffbeafbdfaf" H "abababdeef") ))
(assert (= (str.++  "aebcefcffadceeabecadeeaae" I "ccbfadcbcf")  (str.++  "aebcefcffadceeabecadeeaaebcddcccbfadcbcf" "") ))
(assert (>=(* (str.len I) 13) 13))
(assert (>=(* (str.len E) 17) 204))
(assert (<=(* (str.len E) 14) 1834))
(assert (<=(* (str.len H) 14) 126))
(assert (<=(* (str.len F) 9) 1539))
(check-sat)
(get-model)
