(set-logic QF_S)
(declare-fun _var_0xINPUT_129628_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++ _var_0xINPUT_129628_  "")(str.++ __woorpje_diseq_pref1_  "B" __woorpje_diseq_suf_l1_  "")) )
(assert (=(str.++  "cm6AfB9De3" "")(str.++ __woorpje_diseq_pref1_  "3" __woorpje_diseq_suf_r1_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_129628_)(- 1)) (- 1)) )
(check-sat)
