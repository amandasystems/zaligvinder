(set-logic QF_S)
(declare-fun _var_0xINPUT_125206_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_125206_  "")(str.++ __woorpje_diseq_pref0_  "f" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "O9OjaJf9HF" "")(str.++ __woorpje_diseq_pref0_  "F" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
