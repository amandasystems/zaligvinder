(set-logic QF_S)
(declare-fun _var_0xINPUT_198738_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++  "A9jaaDKZbG" "")(str.++ _var_0xINPUT_198738_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_198738_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_198738_)(- 1)) (- 1)) )
(check-sat)
