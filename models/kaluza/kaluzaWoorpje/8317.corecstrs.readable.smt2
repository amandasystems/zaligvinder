(set-logic QF_S)
(declare-fun _var_0xINPUT_104597_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "MEN6F4KUb1" "")(str.++ __woorpje_diseq_pref0_  "4" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_104597_  "")(str.++ __woorpje_diseq_pref0_  "1" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
