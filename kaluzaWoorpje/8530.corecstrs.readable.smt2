(set-logic QF_S)
(declare-fun _var_0xINPUT_157159_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_157159_  "")(str.++ __woorpje_diseq_pref0_  "G" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "bZAHP6GSLA" "")(str.++ __woorpje_diseq_pref0_  "L" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
