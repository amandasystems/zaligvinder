(set-logic QF_S)
(declare-fun _var_0xINPUT_106686_() String)
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
(declare-fun __woorpje_diseq_pref4_() String)
(declare-fun __woorpje_diseq_suf_l4_() String)
(declare-fun __woorpje_diseq_suf_r4_() String)
(assert (=(str.++  "L2e4ETpOua" "")(str.++ __woorpje_diseq_pref0_  "u" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_106686_  "")(str.++ __woorpje_diseq_pref0_  "a" __woorpje_diseq_suf_r0_  "")) )
(assert (=(str.++  "A9jaaDKZbG" "")(str.++ __woorpje_diseq_pref3_  "A" __woorpje_diseq_suf_l3_  "")) )
(assert (=(str.++ _var_0xINPUT_106686_  "")(str.++ __woorpje_diseq_pref3_  "L" __woorpje_diseq_suf_r3_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_106686_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_106686_)1) 9) )
(assert  (<= (* (str.len _var_0xINPUT_106686_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_106686_)1) 9) )
(check-sat)
