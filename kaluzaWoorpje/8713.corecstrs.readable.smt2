(set-logic QF_S)
(declare-fun _var_0xINPUT_108246_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "ELfNeuAUdI" "")(str.++ __woorpje_diseq_pref0_  "u" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_108246_  "")(str.++ __woorpje_diseq_pref0_  "I" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
