(set-logic QF_S)
(declare-fun _var_0xINPUT_137653_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "49RBEIW3T7" "")(str.++ __woorpje_diseq_pref0_  "I" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_137653_  "")(str.++ __woorpje_diseq_pref0_  "7" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
