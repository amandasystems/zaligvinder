(set-logic QF_S)
(declare-fun _var_0xINPUT_121351_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_121351_  "")(str.++ __woorpje_diseq_pref0_  "O" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "La1DEvaOp9" "")(str.++ __woorpje_diseq_pref0_  "9" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
