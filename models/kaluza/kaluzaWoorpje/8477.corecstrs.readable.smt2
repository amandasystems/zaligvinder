(set-logic QF_S)
(declare-fun _var_0xINPUT_110112_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "rAdAdKXaYb" "")(str.++ __woorpje_diseq_pref0_  "a" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_110112_  "")(str.++ __woorpje_diseq_pref0_  "b" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
