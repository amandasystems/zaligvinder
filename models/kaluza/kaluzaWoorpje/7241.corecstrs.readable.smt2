(set-logic QF_S)
(declare-fun _var_0xINPUT_77348_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++ _var_0xINPUT_77348_  "")(str.++ __woorpje_diseq_pref1_  "E" __woorpje_diseq_suf_l1_  "")) )
(assert (=(str.++  "AA1ND6MEXd" "")(str.++ __woorpje_diseq_pref1_  "d" __woorpje_diseq_suf_r1_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_77348_)(- 1)) (- 11)) )
(check-sat)
