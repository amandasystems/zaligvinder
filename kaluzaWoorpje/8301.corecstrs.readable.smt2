(set-logic QF_S)
(declare-fun _var_0xINPUT_102697_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "aEHYUlvLDq" "")(str.++ __woorpje_diseq_pref0_  "l" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_102697_  "")(str.++ __woorpje_diseq_pref0_  "q" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
