(set-logic QF_S)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun var_0xINPUT_113845 () String)
(assert (= T_1 (= "FCDOnAnCkg" var_0xINPUT_113845)))
(assert (= T_2 (not T_1)))
(assert T_2)
(check-sat)
