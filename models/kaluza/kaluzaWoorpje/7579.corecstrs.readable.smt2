(set-logic QF_S)
(declare-fun _var_0xINPUT_352000_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++ _var_0xINPUT_352000_  "")(str.++  "array" "")) )
(assert  (<= (* (str.len _var_0xINPUT_352000_)(- 1)) (- 1)) )
(check-sat)