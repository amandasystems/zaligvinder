(set-logic QF_S)
(declare-fun _var_0xINPUT_233973_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(assert (=(str.++  "4PH2ujcENG" "")(str.++ _var_0xINPUT_233973_  "")) )
(assert (=(str.++ _var_0xINPUT_233973_  "")(str.++  "4PH2ujcENG" "")) )
(check-sat)
