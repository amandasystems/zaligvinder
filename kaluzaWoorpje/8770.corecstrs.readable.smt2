(set-logic QF_S)
(declare-fun _var_0xINPUT_156141_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_156141_  "")(str.++ __woorpje_diseq_pref0_  "L" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "MApNM9cLGT" "")(str.++ __woorpje_diseq_pref0_  "T" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
