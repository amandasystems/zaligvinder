(set-logic QF_S)
(declare-fun _var_0xINPUT_123823_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_123823_  "")(str.++ __woorpje_diseq_pref0_  "u" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "2FEKmucJrB" "")(str.++ __woorpje_diseq_pref0_  "B" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
