(set-logic QF_S)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun var_0xINPUT_358892 () String)
(assert (= T_1 (not (= "" var_0xINPUT_358892))))
(assert T_1)
(assert (= T_2 (not (= "" var_0xINPUT_358892))))
(assert T_2)
(assert (= T_3 (not (= var_0xINPUT_358892 "3s71lxYG6e"))))
(assert T_3)
(check-sat)
