(set-logic QF_S)
(declare-fun _var_0xINPUT_116914_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "BDWWfFeWLE" "")(str.++ __woorpje_diseq_pref0_  "e" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_116914_  "")(str.++ __woorpje_diseq_pref0_  "E" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
