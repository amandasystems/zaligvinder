(set-logic QF_S)
(declare-fun _var_0xINPUT_102206_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_102206_  "")(str.++ __woorpje_diseq_pref0_  "C" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "bJFPuuPCME" "")(str.++ __woorpje_diseq_pref0_  "E" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
