(set-logic QF_S)
(declare-fun _var_0xINPUT_102854_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "TeQEA0JCLg" "")(str.++ __woorpje_diseq_pref0_  "0" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_102854_  "")(str.++ __woorpje_diseq_pref0_  "g" __woorpje_diseq_suf_r0_  "")) )
(check-sat)