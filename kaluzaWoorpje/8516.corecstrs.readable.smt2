(set-logic QF_S)
(declare-fun _var_0xINPUT_134136_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_134136_  "")(str.++ __woorpje_diseq_pref0_  "S" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "EUDUUeDSmh" "")(str.++ __woorpje_diseq_pref0_  "h" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
