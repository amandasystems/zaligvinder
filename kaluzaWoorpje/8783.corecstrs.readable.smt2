(set-logic QF_S)
(declare-fun _var_0xINPUT_167618_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "Bk53QciYAF" "")(str.++ __woorpje_diseq_pref0_  "c" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_167618_  "")(str.++ __woorpje_diseq_pref0_  "F" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
