(declare-fun T1_11 () String)
(declare-fun T1_4 () String)
(declare-fun T1_8 () String)
(declare-fun T2_11 () String)
(declare-fun T2_4 () String)
(declare-fun T2_8 () String)
(declare-fun T_1 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () String)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () String)
(declare-fun T_8 () Bool)
(declare-fun var_0xINPUT_14920 () String)
(assert (= T_1 (str.++ T1_4 T2_4)))
(assert (= T2_4 var_0xINPUT_14920))
(assert (= T1_4 ""))
(assert (= T_2 (= "-" T_1)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (str.++ T1_8 T2_8)))
(assert (= T2_8 var_0xINPUT_14920))
(assert (= T1_8 ""))
(assert (= T_5 (= "" T_4)))
(assert (= T_6 (not T_5)))
(assert T_6)
(assert (= T_7 (str.++ T1_11 T2_11)))
(assert (= T2_11 var_0xINPUT_14920))
(assert (= T1_11 ""))
(assert (= T_8 (= "" T_7)))
(assert T_8)
(check-sat)