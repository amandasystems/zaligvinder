(declare-fun I0_6 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_6 () String)
(declare-fun T1_6 () String)
(declare-fun T2_6 () String)
(declare-fun T3_6 () String)
(declare-fun T4_6 () String)
(declare-fun T5_6 () String)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_8 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun var_0xINPUT_119325 () String)
(assert (= T_1 (not (= "" var_0xINPUT_119325))))
(assert T_1)
(assert (= T_2 (= "-" var_0xINPUT_119325)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (= "" var_0xINPUT_119325)))
(assert T_4)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_6 0))(= var_0xINPUT_119325 (str.++ T0_6 T1_6))(= I0_6 (str.len T4_6))(= 0 (str.len T0_6))(= T1_6 (str.++ T2_6 T3_6))(= T2_6 (str.++ T4_6 T5_6))(= T5_6 "__utma=16886264.")(not (str.in.re T4_6 (re.++   (str.to.re "_" )  (re.++   (str.to.re "_" ) (re.++  (str.to.re "u" ) (re.++  (str.to.re "t" ) (re.++  (str.to.re "m" ) (re.++  (str.to.re "a" ) (re.++  (str.to.re "=" ) (re.++  (str.to.re "1" ) (re.++  (str.to.re "6" ) (re.++  (str.to.re "8" ) (re.++  (str.to.re "8" ) (re.++  (str.to.re "6" ) (re.++  (str.to.re "2" ) (re.++  (str.to.re "6" ) (re.++  (str.to.re "4" )  (str.to.re "." )  ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ))) (and (= PCTEMP_LHS_1 (- 1))(= var_0xINPUT_119325 (str.++ T0_6 T1_6))(= 0 (str.len T0_6))(not (str.in.re T1_6 (re.++   (str.to.re "_" )  (re.++   (str.to.re "_" ) (re.++  (str.to.re "u" ) (re.++  (str.to.re "t" ) (re.++  (str.to.re "m" ) (re.++  (str.to.re "a" ) (re.++  (str.to.re "=" ) (re.++  (str.to.re "1" ) (re.++  (str.to.re "6" ) (re.++  (str.to.re "8" ) (re.++  (str.to.re "8" ) (re.++  (str.to.re "6" ) (re.++  (str.to.re "2" ) (re.++  (str.to.re "6" ) (re.++  (str.to.re "4" )  (str.to.re "." )  ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )))))
(assert (= T_6 (< (- 1) PCTEMP_LHS_1)))
(assert (= T_7 (not T_6)))
(assert T_7)
(assert (= T_8 (= "-" var_0xINPUT_119325)))
(assert T_8)
(check-sat)