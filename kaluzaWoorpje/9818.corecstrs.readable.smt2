(set-logic QF_S)
(declare-fun _var_0xINPUT_35621_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "https:" "")(str.++ __woorpje_diseq_pref0_  "p" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_35621_  "")(str.++ __woorpje_diseq_pref0_  ":" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
