(set-logic QF_S)
(declare-fun _var_0xINPUT_102449_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_102449_  "")(str.++ __woorpje_diseq_pref0_  "j" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "RYAQBaYjns" "")(str.++ __woorpje_diseq_pref0_  "s" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
