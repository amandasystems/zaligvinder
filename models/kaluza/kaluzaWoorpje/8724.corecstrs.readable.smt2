(set-logic QF_S)
(declare-fun _var_0xINPUT_113717_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++ _var_0xINPUT_113717_  "")(str.++ __woorpje_diseq_pref0_  "U" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++  "Hf68kWUPfX" "")(str.++ __woorpje_diseq_pref0_  "X" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
