(set-logic QF_S)
(declare-fun _var_0xINPUT_171891_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_171891_  "")(str.++ __woorpje_diseq_pref0_  "O" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "N0283QO2bA" "")(str.++ __woorpje_diseq_pref0_  "A" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
