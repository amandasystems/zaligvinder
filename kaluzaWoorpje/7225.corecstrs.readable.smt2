(set-logic QF_S)
(declare-fun _var_0xINPUT_116252_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++ _var_0xINPUT_116252_  "")(str.++ __woorpje_diseq_pref1_  "D" __woorpje_diseq_suf_l1_  "")) )
(assert (=(str.++  "ywUN4ZIDAC" "")(str.++ __woorpje_diseq_pref1_  "C" __woorpje_diseq_suf_r1_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_116252_)(- 1)) (- 11)) )
(check-sat)
