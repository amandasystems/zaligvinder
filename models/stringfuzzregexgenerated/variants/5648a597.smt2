(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.* (str.to.re "000"))) (re.++ (re.union (re.+ (str.to.re "11")) (re.* (str.to.re "2"))) (re.++ (re.* (re.+ (str.to.re "3"))) (re.++ (re.+ (re.* (str.to.re "444"))) (re.++ (re.union (re.* (str.to.re "555")) (re.+ (str.to.re "6"))) (re.++ (re.union (re.* (str.to.re "77")) (re.* (str.to.re "88"))) (re.++ (re.+ (re.union (str.to.re "9") (str.to.re "a"))) (re.++ (re.union (re.+ (str.to.re "b")) (re.+ (str.to.re "ccc"))) (re.++ (re.+ (re.* (str.to.re "d"))) (re.union (re.union (str.to.re "eee") (str.to.re "ff")) (re.* (str.to.re "g"))))))))))))))
(assert (<= 376 (str.len var0)))
(check-sat)
