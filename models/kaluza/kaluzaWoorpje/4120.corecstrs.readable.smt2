(set-logic QF_S)
(declare-fun _var_0xINPUT_185938_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(declare-fun __woorpje_diseq_pref2_() String)
(declare-fun __woorpje_diseq_suf_l2_() String)
(declare-fun __woorpje_diseq_suf_r2_() String)
(assert (=(str.++ _var_0xINPUT_185938_  "")(str.++ __woorpje_diseq_pref2_  "x" __woorpje_diseq_suf_l2_  "")) )
(assert (=(str.++  "3s71lxYG6e" "")(str.++ __woorpje_diseq_pref2_  "e" __woorpje_diseq_suf_r2_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_185938_)(- 1)) (- 11)) )
(assert  (<= (* (str.len _var_0xINPUT_185938_)(- 1)) (- 1)) )
(check-sat)