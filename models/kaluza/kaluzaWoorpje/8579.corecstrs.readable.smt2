(set-logic QF_S)
(declare-fun _var_0xINPUT_107167_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "d1SVUBC1Sf" "")(str.++ __woorpje_diseq_pref0_  "B" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_107167_  "")(str.++ __woorpje_diseq_pref0_  "f" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
