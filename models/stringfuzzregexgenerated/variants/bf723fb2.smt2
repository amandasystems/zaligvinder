(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.+ (re.* (str.to.re "000"))) (re.++ (re.* (re.union (str.to.re "11") (str.to.re "222"))) (re.++ (re.* (re.union (str.to.re "33") (str.to.re "444"))) (re.++ (re.+ (re.* (str.to.re "55"))) (re.++ (re.union (re.+ (str.to.re "666")) (re.+ (str.to.re "777"))) (re.++ (re.* (re.union (str.to.re "8") (str.to.re "99"))) (re.++ (re.union (re.+ (str.to.re "a")) (re.* (str.to.re "bbb"))) (re.++ (re.union (re.+ (str.to.re "cc")) (re.* (str.to.re "d"))) (re.++ (re.* (re.* (str.to.re "e"))) (re.* (re.++ (str.to.re "f") (str.to.re "ggg"))))))))))))))
(assert (<= 126 (str.len var0)))
(check-sat)
