(set-logic QF_S)
(declare-fun _var_0xINPUT_206949_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(declare-fun __woorpje_diseq_pref2_() String)
(declare-fun __woorpje_diseq_suf_l2_() String)
(declare-fun __woorpje_diseq_suf_r2_() String)
(assert (=(str.++  "qXdHDo7IZR" "")(str.++ __woorpje_diseq_pref0_  "o" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_206949_  "")(str.++ __woorpje_diseq_pref0_  "R" __woorpje_diseq_suf_r0_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_206949_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_206949_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_206949_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_206949_)(- 1)) (- 1)) )
(check-sat)
