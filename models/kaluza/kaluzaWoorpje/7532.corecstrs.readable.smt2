(set-logic QF_S)
(declare-fun _var_0xINPUT_290351_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++  "o7E1eVAEe3" "")(str.++ __woorpje_diseq_pref0_  "V" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_290351_  "")(str.++ __woorpje_diseq_pref0_  "3" __woorpje_diseq_suf_r0_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_290351_)(- 1)) (- 1)) )
(check-sat)
