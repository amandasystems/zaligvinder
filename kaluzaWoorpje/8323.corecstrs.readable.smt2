(set-logic QF_S)
(declare-fun _var_0xINPUT_105446_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "BEAw8f6uIu" "")(str.++ __woorpje_diseq_pref0_  "6" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_105446_  "")(str.++ __woorpje_diseq_pref0_  "I" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
