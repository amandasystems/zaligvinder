(set-logic QF_S)
(declare-fun _var_0xINPUT_153374_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "VZCCTTfYY8" "")(str.++ __woorpje_diseq_pref0_  "f" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_153374_  "")(str.++ __woorpje_diseq_pref0_  "8" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
