(set-logic QF_S)
(declare-fun _var_0xINPUT_154418_() String)
(declare-fun __woorpje_diseq_pref0_() String)
(declare-fun __woorpje_diseq_suf_l0_() String)
(declare-fun __woorpje_diseq_suf_r0_() String)
(declare-fun __woorpje_diseq_pref1_() String)
(declare-fun __woorpje_diseq_suf_l1_() String)
(declare-fun __woorpje_diseq_suf_r1_() String)
(declare-fun __woorpje_diseq_pref2_() String)
(declare-fun __woorpje_diseq_suf_l2_() String)
(declare-fun __woorpje_diseq_suf_r2_() String)
(declare-fun __woorpje_diseq_pref3_() String)
(declare-fun __woorpje_diseq_suf_l3_() String)
(declare-fun __woorpje_diseq_suf_r3_() String)
(declare-fun __woorpje_diseq_pref4_() String)
(declare-fun __woorpje_diseq_suf_l4_() String)
(declare-fun __woorpje_diseq_suf_r4_() String)
(assert (=(str.++  "CQALcCP5TB" "")(str.++ _var_0xINPUT_154418_  "")) )
(assert (=(str.++ _var_0xINPUT_154418_  "")(str.++ __woorpje_diseq_pref2_  "C" __woorpje_diseq_suf_l2_  "")) )
(assert (=(str.++  "2vbcJ9lN6J" "")(str.++ __woorpje_diseq_pref2_  "2" __woorpje_diseq_suf_r2_  "")) )
(assert (=(str.++  "2vbcJ9lN6J" "")(str.++ __woorpje_diseq_pref3_  "2" __woorpje_diseq_suf_l3_  "")) )
(assert (=(str.++ _var_0xINPUT_154418_  "")(str.++ __woorpje_diseq_pref3_  "C" __woorpje_diseq_suf_r3_  "")) )
(assert (=(str.++ _var_0xINPUT_154418_  "")(str.++ __woorpje_diseq_pref2_  "C" __woorpje_diseq_suf_l2_  "")) )
(assert (=(str.++  "2vbcJ9lN6J" "")(str.++ __woorpje_diseq_pref2_  "2" __woorpje_diseq_suf_r2_  "")) )
(assert (=(str.++  "2vbcJ9lN6J" "")(str.++ __woorpje_diseq_pref3_  "2" __woorpje_diseq_suf_l3_  "")) )
(assert (=(str.++ _var_0xINPUT_154418_  "")(str.++ __woorpje_diseq_pref3_  "C" __woorpje_diseq_suf_r3_  "")) )
(assert  (<= (* (str.len _var_0xINPUT_154418_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_154418_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_154418_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_154418_)(- 1)) (- 1)) )
(assert  (<= (* (str.len _var_0xINPUT_154418_)(- 1)) (- 1)) )
(check-sat)