(set-logic QF_S)
(declare-fun _var_0xINPUT_128086_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_128086_  "")(str.++ __woorpje_diseq_pref0_  "m" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "vKHWOKSm3E" "")(str.++ __woorpje_diseq_pref0_  "E" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
