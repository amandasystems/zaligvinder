(set-logic QF_S)
(declare-fun _var_0xINPUT_101958_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_101958_  "")(str.++ __woorpje_diseq_pref0_  "D" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "94XeGFD9LR" "")(str.++ __woorpje_diseq_pref0_  "R" __woorpje_diseq_suf_r0_  "")) )
(check-sat)