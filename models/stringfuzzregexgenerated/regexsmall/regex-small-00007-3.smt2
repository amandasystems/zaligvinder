(set-logic QF_S)
(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.+ (str.to.re "0")) (re.union (str.to.re "11") (str.to.re "222"))) (re.++ (re.+ (re.+ (str.to.re "3"))) (re.++ (re.union (re.+ (str.to.re "4")) (re.+ (str.to.re "55"))) (re.++ (re.+ (re.+ (str.to.re "6"))) (re.++ (re.* (re.* (str.to.re "77"))) (re.++ (re.* (re.+ (str.to.re "8"))) (re.* (re.union (str.to.re "999") (str.to.re "aaa")))))))))))
(check-sat)