(set-logic QF_S)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun var_0xINPUT_63289 () String)
(assert (= T_1 (not (= "qXdHDo7IZR" var_0xINPUT_63289))))
(assert (= T_2 (not T_1)))
(assert T_2)
(assert (= T_3 (not (= "" var_0xINPUT_63289))))
(assert T_3)
(assert (= T_4 (= var_0xINPUT_63289 "Example:")))
(assert (= T_5 (not T_4)))
(assert T_5)
(assert (= T_6 (not (= var_0xINPUT_63289 "qXdHDo7IZR"))))
(assert (= T_7 (not T_6)))
(assert T_7)
(check-sat)
