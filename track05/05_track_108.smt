(set-logic QF_S)
(declare-fun H () String)
(declare-fun B () String)
(declare-fun C () String)
(declare-fun J () String)
(assert (= (str.++  "dd" B "efcdedbaafcdbcbbbaf")  (str.++  "dddceebcbf" H "aafcdbcbbbaf") ))
(assert (= (str.++  "fddeadddbeeeabdaeadffbbfcafeadefceeceffe" "")  (str.++  "fddeadddbeeeabdaeadffbbfca" J "efceeceffe") ))
(assert (= (str.++  "b" C "bccdffaeddcddecfcddebcbcfcabaabeff")  (str.++  "bfecefbccdffaeddcddecfcddebcbcfcabaabeff" "") ))
(assert (>=(* (str.len H) 1) 7))
(assert (<=(* (str.len H) 20) 1380))
(check-sat)
(get-model)
