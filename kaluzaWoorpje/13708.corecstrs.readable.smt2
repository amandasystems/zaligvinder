(set-logic QF_S)
(declare-fun _var_0xINPUT_265325_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "4PH2ujcENG" "")(str.++ __woorpje_diseq_pref0_  "j" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_265325_  "")(str.++ __woorpje_diseq_pref0_  "G" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
