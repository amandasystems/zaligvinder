(set-logic QF_S)
(declare-fun _var_0xINPUT_119282_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++  "-" "")(str.++ _var_0xINPUT_119282_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_119282_)(- 1)) (- 1)) )
(check-sat)
