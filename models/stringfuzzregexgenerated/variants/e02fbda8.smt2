(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.* (str.to.re "0"))) (re.++ (re.* (re.+ (str.to.re "1"))) (re.++ (re.+ (re.+ (str.to.re "222"))) (re.++ (re.union (re.union (str.to.re "3") (str.to.re "44")) (re.+ (str.to.re "5"))) (re.++ (re.+ (re.union (str.to.re "6") (str.to.re "777"))) (re.++ (re.union (re.+ (str.to.re "888")) (re.* (str.to.re "99"))) (re.++ (re.* (re.union (str.to.re "aaa") (str.to.re "bb"))) (re.++ (re.* (re.union (str.to.re "ccc") (str.to.re "d"))) (re.++ (re.* (re.+ (str.to.re "ee"))) (re.union (re.+ (re.+ (re.* (re.+ re.allchar)))) (re.* (str.to.re "g"))))))))))))))
(assert (<= 326 (str.len var0)))
(check-sat)
