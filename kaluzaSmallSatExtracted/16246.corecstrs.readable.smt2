(declare-fun T_1 () Bool)
(declare-fun var_0xINPUT_86642 () String)
(assert (= T_1 (not (= "file:" var_0xINPUT_86642))))
(assert T_1)
(check-sat)
