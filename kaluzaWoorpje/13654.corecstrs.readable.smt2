(set-logic QF_S)
(declare-fun _var_0xINPUT_160703_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "cm6AfB9De3" "")(str.++ __woorpje_diseq_pref0_  "B" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_160703_  "")(str.++ __woorpje_diseq_pref0_  "3" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
