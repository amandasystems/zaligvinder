(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.+ (str.to.re "00")) (re.+ (str.to.re "11"))) (re.++ (re.* (re.union (str.to.re "22") (str.to.re "3"))) (re.++ (re.* (re.* (str.to.re "44"))) (re.++ (re.+ (re.+ (str.to.re "5"))) (re.++ (re.* (re.+ (str.to.re "6"))) (re.++ (re.+ (re.+ (str.to.re "7"))) (re.++ (re.* (re.* (str.to.re "88"))) (re.++ (re.+ (re.* (str.to.re "99"))) (re.++ (re.union (re.* (str.to.re "a")) (re.* (str.to.re "bbb"))) (re.* (re.union (re.* (re.* (re.++ (re.++ (str.to.re "") (str.to.re "")) (re.++ (str.to.re "") (str.to.re ""))))) (str.to.re "d"))))))))))))))
(assert (<= 401 (str.len var0)))
(check-sat)
