(set-logic QF_S)
(declare-fun _var_0xINPUT_169586_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_169586_  "")(str.++ __woorpje_diseq_pref0_  "Q" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "0MvVN7QHdM" "")(str.++ __woorpje_diseq_pref0_  "d" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
