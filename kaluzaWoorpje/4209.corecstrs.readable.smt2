(set-logic QF_S)
(declare-fun _var_0xINPUT_252286_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++ _var_0xINPUT_252286_  "")(str.++ __woorpje_diseq_pref1_  "d" __woorpje_diseq_suf_l1_  "")) )
(assert (=(str.++  "ND6MEXdqBD" "")(str.++ __woorpje_diseq_pref1_  "B" __woorpje_diseq_suf_r1_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_252286_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_252286_)(- 1)) (- 1)) )
(check-sat)
