(set-logic QF_S)
(declare-fun _var_0xINPUT_398476_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_398476_  "")(str.++  "Search" "")) )
(check-sat)