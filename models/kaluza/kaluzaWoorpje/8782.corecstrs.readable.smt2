(set-logic QF_S)
(declare-fun _var_0xINPUT_167574_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_167574_  "")(str.++ __woorpje_diseq_pref0_  "f" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "LxWpKfCjLf" "")(str.++ __woorpje_diseq_pref0_  "j" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
