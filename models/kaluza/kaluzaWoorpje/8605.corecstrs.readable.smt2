(set-logic QF_S)
(declare-fun _var_0xINPUT_122993_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert (=(str.++  "aEddFeBv9L" "")(str.++ __woorpje_diseq_pref0_  "v" __woorpje_diseq_suf_l0_  "")) )
(assert (=(str.++ _var_0xINPUT_122993_  "")(str.++ __woorpje_diseq_pref0_  "L" __woorpje_diseq_suf_r0_  "")) )
(check-sat)
