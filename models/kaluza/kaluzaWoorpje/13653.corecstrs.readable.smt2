(set-logic QF_S)
(declare-fun _var_0xINPUT_159446_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "AUEAICDdfN" "")(str.++ __woorpje_diseq_pref0_  "d" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_159446_  "")(str.++ __woorpje_diseq_pref0_  "N" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
