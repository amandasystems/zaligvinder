(set-logic QF_S)
(declare-fun _var_0xINPUT_101996_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_101996_  "")(str.++ __woorpje_diseq_pref0_  "P" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "TSQsiPBfXC" "")(str.++ __woorpje_diseq_pref0_  "C" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
