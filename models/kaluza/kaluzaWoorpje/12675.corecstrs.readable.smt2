(set-logic QF_S)
(declare-fun _var_0xINPUT_266745_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(assert  (<= (* (str.len _var_0xINPUT_266745_)(- 1)) (- 1)) )
(check-sat)