(declare-fun T_1 () Bool)
(declare-fun var_0xINPUT_108103 () String)
(assert (= T_1 (not (= "file:" var_0xINPUT_108103))))
(assert T_1)
(check-sat)