(set-logic QF_S)
(declare-fun _var_0xINPUT_125843_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_125843_  "")(str.++ __woorpje_diseq_pref0_  "u" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "Cdcb45uc2E" "")(str.++ __woorpje_diseq_pref0_  "E" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
