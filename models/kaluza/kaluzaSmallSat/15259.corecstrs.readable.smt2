(declare-fun T_1 () Bool)
(declare-fun var_0xINPUT_156541 () String)
(assert (= T_1 (not (= "file:" var_0xINPUT_156541))))
(assert T_1)
(check-sat)