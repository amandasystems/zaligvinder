(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.+ (str.to.re "0"))) (re.++ (re.union (re.union (str.to.re "111") (str.to.re "222")) (re.* (str.to.re "33"))) (re.++ (re.union (re.* (str.to.re "444")) (re.+ (str.to.re "555"))) (re.++ (re.+ (re.* (str.to.re "66"))) (re.++ (re.union (re.union (str.to.re "7") (str.to.re "88")) (re.+ (str.to.re "9"))) (re.++ (re.* (re.+ (str.to.re "aaa"))) (re.++ (re.union (re.+ (str.to.re "bbb")) (re.* (str.to.re "cc"))) (re.++ (re.+ (re.+ (str.to.re "d"))) (re.++ (re.+ (re.* (str.to.re "ee"))) (re.+ (re.+ (str.to.re "fff"))))))))))))))
(assert (<= 226 (str.len var0)))
(check-sat)
