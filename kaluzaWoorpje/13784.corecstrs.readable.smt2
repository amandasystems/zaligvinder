(set-logic QF_S)
(declare-fun _var_0xINPUT_98547_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "fB9De3KAY9" "")(str.++ __woorpje_diseq_pref0_  "K" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_98547_  "")(str.++ __woorpje_diseq_pref0_  "Y" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
