(set-logic QF_S)
(declare-fun _var_0xINPUT_154658_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_154658_  "")(str.++ __woorpje_diseq_pref0_  "2" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "5CaBDD52dw" "")(str.++ __woorpje_diseq_pref0_  "w" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
