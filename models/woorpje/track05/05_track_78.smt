(set-logic QF_S)
(declare-fun I () String)
(declare-fun C () String)
(declare-fun F () String)
(assert (= (str.++  "c" F "afcbfcbccccfcdebca")  (str.++  "c" C "a") ))
(assert (= (str.++  "daefbddefaf" I "aeecbafaecfeabffffacecdae")  (str.++  "daefbddefafefbeaeecbafaecfeabffffacecdae" "") ))
(assert (= (str.++  "da" I "dfbecebeacfafaccccfeedebeccbffefad")  (str.++  "daefbedfbecebeacfafaccccfeedebeccbffefad" "") ))
(assert (<=(* (str.len F) 13) 3705))
(assert (<=(* (str.len C) 15) 2040))
(assert (<=(* (str.len I) 3) 57))
(check-sat)
(get-model)