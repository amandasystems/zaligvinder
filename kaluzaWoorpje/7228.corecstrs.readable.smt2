(set-logic QF_S)
(declare-fun _var_0xINPUT_151689_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++ _var_0xINPUT_151689_  "")(str.++ __woorpje_diseq_pref1_  "I" __woorpje_diseq_suf_l1_  "")) )
(assert (=(str.++  "qXdHDo7IZR" "")(str.++ __woorpje_diseq_pref1_  "R" __woorpje_diseq_suf_r1_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_151689_)(- 1)) (- 11)) )
(check-sat)
