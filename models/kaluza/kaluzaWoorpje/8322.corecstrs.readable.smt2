(set-logic QF_S)
(declare-fun _var_0xINPUT_105402_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_105402_  "")(str.++ __woorpje_diseq_pref0_  "E" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "8vnCiEf4c7" "")(str.++ __woorpje_diseq_pref0_  "7" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
