(set-logic QF_S)
(declare-fun _var_0xINPUT_112004_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "6dg2QN1ILB" "")(str.++ __woorpje_diseq_pref0_  "N" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_112004_  "")(str.++ __woorpje_diseq_pref0_  "B" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
