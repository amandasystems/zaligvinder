(set-logic QF_S)
(declare-fun _var_0xINPUT_158838_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "dw7S6nhCXU" "")(str.++ __woorpje_diseq_pref0_  "n" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_158838_  "")(str.++ __woorpje_diseq_pref0_  "U" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
