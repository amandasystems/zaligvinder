(set-logic QF_S)
(declare-fun _var_0xINPUT_151669_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "ACCCB42p9F" "")(str.++ __woorpje_diseq_pref0_  "p" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_151669_  "")(str.++ __woorpje_diseq_pref0_  "F" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
