(set-logic QF_S)
(declare-fun _var_0xINPUT_221875_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(declare-fun __woorpje_diseq_pref2_() String)
(declare-fun __woorpje_diseq_suf_l2_() String)
(declare-fun __woorpje_diseq_suf_r2_() String)
(assert (=(str.++  "cm6AfB9De3" "")(str.++ __woorpje_diseq_pref0_  "B" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_221875_  "")(str.++ __woorpje_diseq_pref0_  "3" __woorpje_diseq_suf_r0_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_221875_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_221875_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_221875_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_221875_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_221875_)(- 1)) (- 1)) )
(check-sat)