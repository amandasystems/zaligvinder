(set-logic QF_S)
(declare-fun _var_0xINPUT_116010_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_116010_  "")(str.++ __woorpje_diseq_pref0_  "d" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "jAkM6bdGZd" "")(str.++ __woorpje_diseq_pref0_  "Z" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
