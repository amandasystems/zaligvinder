(set-logic QF_S)
(declare-fun _var_0xINPUT_114395_() String)
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
(assert (=(str.++  "ywUN4ZIDAC" "")(str.++ __woorpje_diseq_pref0_  "y" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_114395_  "")(str.++ __woorpje_diseq_pref0_  "4" __woorpje_diseq_suf_r0_  "")) )
(assert (=(str.++ _var_0xINPUT_114395_  "")(str.++ __woorpje_diseq_pref2_  "4" __woorpje_diseq_suf_l2_  "")) )
(assert (=(str.++  "Example:" "")(str.++ __woorpje_diseq_pref2_  "E" __woorpje_diseq_suf_r2_  "")) )
(assert (=(str.++ _var_0xINPUT_114395_  "")(str.++  "4PH2ujcENG" "")) )
(assert  (<= (* (str.len _var_0xINPUT_114395_)(- 1)) (- 1)) )
(check-sat)
