(set-logic QF_S)
(declare-fun _var_0xINPUT_104605_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_104605_  "")(str.++ __woorpje_diseq_pref0_  "7" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "0te4V7iK0e" "")(str.++ __woorpje_diseq_pref0_  "K" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
