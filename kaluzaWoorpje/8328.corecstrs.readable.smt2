(set-logic QF_S)
(declare-fun _var_0xINPUT_107738_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_107738_  "")(str.++ __woorpje_diseq_pref0_  "t" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "nLSb2tUCEH" "")(str.++ __woorpje_diseq_pref0_  "H" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
