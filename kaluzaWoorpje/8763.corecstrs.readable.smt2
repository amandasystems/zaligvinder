(set-logic QF_S)
(declare-fun _var_0xINPUT_145721_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "MEFFQ7WkLf" "")(str.++ __woorpje_diseq_pref0_  "k" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_145721_  "")(str.++ __woorpje_diseq_pref0_  "f" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
