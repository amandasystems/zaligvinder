(set-logic QF_S)
(declare-fun _var_0xINPUT_178718_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_178718_  "")(str.++ __woorpje_diseq_pref0_  "e" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "XTaUCeVRAx" "")(str.++ __woorpje_diseq_pref0_  "x" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
