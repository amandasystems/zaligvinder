(set-logic QF_S)
(declare-fun _var_0xINPUT_121360_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "SU5pBiLAcJ" "")(str.++ __woorpje_diseq_pref0_  "i" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_121360_  "")(str.++ __woorpje_diseq_pref0_  "J" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
