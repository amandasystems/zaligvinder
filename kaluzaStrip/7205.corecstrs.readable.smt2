(set-logic QF_S)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun var_0xINPUT_40965 () String)
(assert (= T_1 (not (= "" var_0xINPUT_40965))))
(assert T_1)
(assert (= T_2 (not (= var_0xINPUT_40965 "6JX7G3VKFq"))))
(assert (= T_3 (not T_2)))
(assert T_3)
(check-sat)
