(set-logic QF_S)
(declare-fun _var_0xINPUT_183714_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_183714_  "")(str.++ __woorpje_diseq_pref0_  "V" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "4AECIKVnRC" "")(str.++ __woorpje_diseq_pref0_  "R" __woorpje_diseq_suf_r0_  "")) )
(check-sat)