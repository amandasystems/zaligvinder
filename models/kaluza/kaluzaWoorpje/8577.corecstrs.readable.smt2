(set-logic QF_S)
(declare-fun _var_0xINPUT_107013_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "35vd8oeY2x" "")(str.++ __woorpje_diseq_pref0_  "o" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_107013_  "")(str.++ __woorpje_diseq_pref0_  "x" __woorpje_diseq_suf_r0_  "")) )
(check-sat)