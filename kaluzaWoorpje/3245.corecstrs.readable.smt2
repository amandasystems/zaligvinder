(set-logic QF_S)
(declare-fun _var_0xINPUT_271642_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(declare-fun __woorpje_diseq_pref2_() String)
(declare-fun __woorpje_diseq_suf_l2_() String)
(declare-fun __woorpje_diseq_suf_r2_() String)
(declare-fun __woorpje_diseq_pref3_() String)
(declare-fun __woorpje_diseq_suf_l3_() String)
(declare-fun __woorpje_diseq_suf_r3_() String)
(assert (=(str.++ _var_0xINPUT_271642_  "")(str.++ __woorpje_diseq_pref2_  "U" __woorpje_diseq_suf_l2_  "")) )
(assert (=(str.++  "ywUN4ZIDAC" "")(str.++ __woorpje_diseq_pref2_  "C" __woorpje_diseq_suf_r2_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_271642_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_271642_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_271642_)(- 1)) (- 11)) )
(assert  (<= (* (str.len _var_0xINPUT_271642_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_271642_)(- 1)) (- 1)) )
(check-sat)
