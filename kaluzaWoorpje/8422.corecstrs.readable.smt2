(set-logic QF_S)
(declare-fun _var_0xINPUT_204095_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_204095_  "")(str.++ __woorpje_diseq_pref0_  "F" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "A4VlcFgBr0" "")(str.++ __woorpje_diseq_pref0_  "0" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
