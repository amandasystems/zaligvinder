(set-logic QF_S)
(declare-fun _var_0xINPUT_187731_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "2FWbcG3ZY9" "")(str.++ __woorpje_diseq_pref0_  "G" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_187731_  "")(str.++ __woorpje_diseq_pref0_  "9" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
