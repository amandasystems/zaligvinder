(set-logic QF_S)
(declare-fun _var_0xINPUT_184772_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "wdBG4cQaaT" "")(str.++ __woorpje_diseq_pref0_  "Q" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_184772_  "")(str.++ __woorpje_diseq_pref0_  "T" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
