(set-logic QF_S)
(declare-fun _var_0xINPUT_222145_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(declare-fun __woorpje_diseq_pref2_() String)
(declare-fun __woorpje_diseq_suf_l2_() String)
(declare-fun __woorpje_diseq_suf_r2_() String)
(assert (=(str.++ _var_0xINPUT_222145_  "")(str.++ __woorpje_diseq_pref2_  "j" __woorpje_diseq_suf_l2_  "")) )
(assert (=(str.++  "4PH2ujcENG" "")(str.++ __woorpje_diseq_pref2_  "G" __woorpje_diseq_suf_r2_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_222145_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_222145_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_222145_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_222145_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_222145_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_222145_)(- 1)) (- 1)) )
(check-sat)
