(set-logic QF_S)
(declare-fun _var_0xINPUT_87518_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++  "AA1ND6MEXd" "")(str.++ _var_0xINPUT_87518_  "")) )
(assert (=(str.++ _var_0xINPUT_87518_  "")(str.++  "AA1ND6MEXd" "")) )
(check-sat)