(set-logic QF_S)
(declare-fun _var_0xINPUT_107494_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_107494_  "")(str.++ __woorpje_diseq_pref0_  "s" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "jd1dCcsCIg" "")(str.++ __woorpje_diseq_pref0_  "g" __woorpje_diseq_suf_r0_  "")) )
(check-sat)