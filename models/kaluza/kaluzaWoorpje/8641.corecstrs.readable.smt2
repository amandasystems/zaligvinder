(set-logic QF_S)
(declare-fun _var_0xINPUT_138467_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "FbE3CYeC7e" "")(str.++ __woorpje_diseq_pref0_  "Y" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_138467_  "")(str.++ __woorpje_diseq_pref0_  "7" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
