(set-logic QF_S)
(declare-fun _var_0xINPUT_103883_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_103883_  "")(str.++ __woorpje_diseq_pref0_  "p" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "Hq9ICIfpOP" "")(str.++ __woorpje_diseq_pref0_  "P" __woorpje_diseq_suf_r0_  "")) )
(check-sat)