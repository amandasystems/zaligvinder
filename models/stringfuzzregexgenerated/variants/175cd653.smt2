(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.* (str.to.re "000"))) (re.++ (re.union (re.* (str.to.re "1")) (re.union (str.to.re "22") (str.to.re "333"))) (re.++ (re.+ (re.+ (str.to.re "444"))) (re.++ (re.* (re.union (str.to.re "555") (str.to.re "66"))) (re.++ (re.+ (re.* (str.to.re "7"))) (re.++ (re.+ (re.+ (str.to.re "8"))) (re.++ (re.union (re.* (str.to.re "99")) (re.* (str.to.re "a"))) (re.++ (re.+ (re.* (str.to.re "b"))) (re.++ (re.union (re.+ (str.to.re "ccc")) (re.union (str.to.re "dd") (str.to.re "ee"))) (re.union (re.+ (str.to.re "f")) (re.union (re.+ (re.+ (re.++ (re.+ re.allchar) (re.* re.allchar)))) (str.to.re "hhh"))))))))))))))
(assert (<= 201 (str.len var0)))
(check-sat)
