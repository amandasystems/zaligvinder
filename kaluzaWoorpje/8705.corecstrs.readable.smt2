(set-logic QF_S)
(declare-fun _var_0xINPUT_104774_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "dE4d5LHxfK" "")(str.++ __woorpje_diseq_pref0_  "x" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_104774_  "")(str.++ __woorpje_diseq_pref0_  "K" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
