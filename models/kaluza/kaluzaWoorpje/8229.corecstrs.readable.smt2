(set-logic QF_S)
(declare-fun _PCTEMP_LHS_1_idx_0_() String)
(declare-fun _T0_2_() String)
(declare-fun _var_0xINPUT_35882_() String)
(assert (=(str.++ _T0_2_  "")(str.++ _PCTEMP_LHS_1_idx_0_  "")) )
(assert (=(str.++ _T0_2_  "")(str.++ _var_0xINPUT_35882_  "")) )
(check-sat)
