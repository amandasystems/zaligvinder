(set-logic QF_S)
(declare-fun _var_0xINPUT_125250_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "OvAGN9wPDO" "")(str.++ __woorpje_diseq_pref0_  "w" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_125250_  "")(str.++ __woorpje_diseq_pref0_  "D" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
