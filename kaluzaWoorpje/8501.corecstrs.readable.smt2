(set-logic QF_S)
(declare-fun _var_0xINPUT_124443_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "3wbCdwGSRC" "")(str.++ __woorpje_diseq_pref0_  "G" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_124443_  "")(str.++ __woorpje_diseq_pref0_  "R" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
