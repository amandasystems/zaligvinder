(set-logic QF_S)
(declare-fun T_1 () Bool)
(declare-fun T_10 () Bool)
(declare-fun T_11 () Bool)
(declare-fun T_12 () Bool)
(declare-fun T_13 () Bool)
(declare-fun T_14 () Bool)
(declare-fun T_15 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_8 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_a () Bool)
(declare-fun T_b () Bool)
(declare-fun T_c () Bool)
(declare-fun T_d () Bool)
(declare-fun T_e () Bool)
(declare-fun T_f () Bool)
(declare-fun var_0xINPUT_133205 () String)
(assert (= T_1 (not (= "ywUN4ZIDAC" var_0xINPUT_133205))))
(assert (= T_2 (not T_1)))
(assert T_2)
(assert (= T_3 (not (= "" var_0xINPUT_133205))))
(assert T_3)
(assert (= T_4 (not (= var_0xINPUT_133205 "CQALcCP5TB"))))
(assert T_4)
(assert (= T_5 (not (= "CQALcCP5TB" var_0xINPUT_133205))))
(assert T_5)
(assert (= T_6 (= var_0xINPUT_133205 "")))
(assert (= T_7 (not T_6)))
(assert T_7)
(assert (= T_8 (not (= "" var_0xINPUT_133205))))
(assert T_8)
(assert (= T_9 (not (= "CQALcCP5TB" var_0xINPUT_133205))))
(assert T_9)
(assert (= T_a (not (= var_0xINPUT_133205 "CQALcCP5TB"))))
(assert T_a)
(assert (= T_b (= var_0xINPUT_133205 "")))
(assert (= T_c (not T_b)))
(assert T_c)
(assert (= T_d (not (= "" var_0xINPUT_133205))))
(assert T_d)
(assert (= T_e (not (= var_0xINPUT_133205 ""))))
(assert T_e)
(assert (= T_f (not (= "" var_0xINPUT_133205))))
(assert T_f)
(assert (= T_10 (= var_0xINPUT_133205 "")))
(assert (= T_11 (not T_10)))
(assert T_11)
(assert (= T_12 (not (= "" var_0xINPUT_133205))))
(assert T_12)
(assert (= T_13 (= var_0xINPUT_133205 "Example:")))
(assert (= T_14 (not T_13)))
(assert T_14)
(assert (= T_15 (not (= var_0xINPUT_133205 ""))))
(assert T_15)
(check-sat)
