(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.+ (re.+ (str.to.re "000"))) (re.++ (re.* (re.+ (str.to.re "1"))) (re.++ (re.+ (re.* (str.to.re "2"))) (re.++ (re.union (re.union (str.to.re "3") (str.to.re "44")) (re.* (str.to.re "5"))) (re.++ (re.* (re.+ (str.to.re "66"))) (re.++ (re.* (re.* (str.to.re "777"))) (re.++ (re.union (re.+ (str.to.re "8")) (re.+ (str.to.re "9"))) (re.++ (re.union (re.+ (str.to.re "aa")) (re.+ (str.to.re "bb"))) (re.++ (re.union (re.+ (str.to.re "c")) (re.+ (str.to.re "dd"))) (re.+ (re.+ (str.to.re "ee"))))))))))))))
(assert (<= 276 (str.len var0)))
(check-sat)
