(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.+ (str.to.re "0"))) (re.++ (re.+ (re.* (str.to.re "11"))) (re.++ (re.+ (re.* (str.to.re "2"))) (re.++ (re.union (re.* (str.to.re "333")) (re.+ (str.to.re "444"))) (re.++ (re.+ (re.union (str.to.re "555") (str.to.re "6"))) (re.++ (re.* (re.* (str.to.re "7"))) (re.++ (re.union (re.+ (str.to.re "8")) (re.union (str.to.re "9") (str.to.re "aaa"))) (re.++ (re.+ (re.union (str.to.re "bbb") (str.to.re "ccc"))) (re.++ (re.+ (re.union (str.to.re "dd") (str.to.re "ee"))) (re.union (re.* (re.* (re.* (re.+ re.allchar)))) (re.* (str.to.re "ggg"))))))))))))))
(assert (<= 351 (str.len var0)))
(check-sat)
