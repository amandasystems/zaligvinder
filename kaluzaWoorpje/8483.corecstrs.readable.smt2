(set-logic QF_S)
(declare-fun _var_0xINPUT_110971_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "OLQOu6tA99" "")(str.++ __woorpje_diseq_pref0_  "t" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_110971_  "")(str.++ __woorpje_diseq_pref0_  "9" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
