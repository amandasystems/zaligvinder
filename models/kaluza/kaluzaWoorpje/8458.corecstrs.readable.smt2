(set-logic QF_S)
(declare-fun _var_0xINPUT_105584_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_105584_  "")(str.++ __woorpje_diseq_pref0_  "T" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "JeaJDTxveD" "")(str.++ __woorpje_diseq_pref0_  "v" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
