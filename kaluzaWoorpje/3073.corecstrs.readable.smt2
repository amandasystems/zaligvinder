(set-logic QF_S)
(declare-fun _var_0xINPUT_166260_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(declare-fun __woorpje_diseq_pref2_() String)
(declare-fun __woorpje_diseq_suf_l2_() String)
(declare-fun __woorpje_diseq_suf_r2_() String)
(assert (=(str.++  "ywUN4ZIDAC" "")(str.++ __woorpje_diseq_pref2_  "Z" __woorpje_diseq_suf_l2_  "")) )
(assert (=(str.++ _var_0xINPUT_166260_  "")(str.++ __woorpje_diseq_pref2_  "C" __woorpje_diseq_suf_r2_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_166260_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_166260_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_166260_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_166260_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_166260_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_166260_)(- 1)) (- 1)) )
(check-sat)
