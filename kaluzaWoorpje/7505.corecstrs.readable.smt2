(set-logic QF_S)
(declare-fun _var_0xINPUT_111490_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++  "ywUN4ZIDAC" "")(str.++ __woorpje_diseq_pref0_  "Z" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_111490_  "")(str.++ __woorpje_diseq_pref0_  "C" __woorpje_diseq_suf_r0_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_111490_)(- 1)) (- 1)) )
(check-sat)
