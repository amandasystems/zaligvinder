(set-logic QF_S)
(declare-fun _var_0xINPUT_95529_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++ _var_0xINPUT_95529_  "")(str.++ __woorpje_diseq_pref1_  "T" __woorpje_diseq_suf_l1_  "")) )
(assert (=(str.++  "L2e4ETpOua" "")(str.++ __woorpje_diseq_pref1_  "a" __woorpje_diseq_suf_r1_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_95529_)(- 1)) (- 1)) )
(check-sat)