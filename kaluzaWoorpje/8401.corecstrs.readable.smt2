(set-logic QF_S)
(declare-fun _var_0xINPUT_177749_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "IQGcvBJaEv" "")(str.++ __woorpje_diseq_pref0_  "J" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_177749_  "")(str.++ __woorpje_diseq_pref0_  "E" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
