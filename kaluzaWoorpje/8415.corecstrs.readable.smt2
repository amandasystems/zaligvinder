(set-logic QF_S)
(declare-fun _var_0xINPUT_190895_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "FGFE9a92FH" "")(str.++ __woorpje_diseq_pref0_  "a" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_190895_  "")(str.++ __woorpje_diseq_pref0_  "H" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
