(set-logic QF_S)
(declare-fun _var_0xINPUT_29341_() String)
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
(assert (=(str.++ _var_0xINPUT_29341_  "")(str.++ __woorpje_diseq_pref4_  "N" __woorpje_diseq_suf_l4_  "")) )
(assert (=(str.++  "CQALcCP5TB" "")(str.++ __woorpje_diseq_pref4_  "C" __woorpje_diseq_suf_r4_  "")) )
(assert (=(str.++ _var_0xINPUT_29341_  "")(str.++ __woorpje_diseq_pref4_  "N" __woorpje_diseq_suf_l4_  "")) )
(assert (=(str.++  "CQALcCP5TB" "")(str.++ __woorpje_diseq_pref4_  "C" __woorpje_diseq_suf_r4_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)1) 9) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)1) 9) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)1) 9) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_29341_)(- 1)) (- 1)) )
(check-sat)