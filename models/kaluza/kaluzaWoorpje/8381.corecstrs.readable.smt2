(set-logic QF_S)
(declare-fun _var_0xINPUT_148700_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "NDOxOncDPL" "")(str.++ __woorpje_diseq_pref0_  "c" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_148700_  "")(str.++ __woorpje_diseq_pref0_  "L" __woorpje_diseq_suf_r0_  "")) )
(check-sat)