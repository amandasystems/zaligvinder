(set-logic QF_S)
(declare-fun _var_0xINPUT_110793_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "94ZJDmvS7C" "")(str.++ __woorpje_diseq_pref0_  "m" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_110793_  "")(str.++ __woorpje_diseq_pref0_  "C" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
