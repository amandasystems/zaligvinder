(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.union (str.to.re "00") (str.to.re "11")) (re.* (str.to.re "22"))) (re.++ (re.* (re.* (str.to.re "333"))) (re.++ (re.+ (re.* (str.to.re "444"))) (re.++ (re.* (re.* (str.to.re "55"))) (re.++ (re.union (re.* (str.to.re "666")) (re.+ (str.to.re "7"))) (re.++ (re.+ (re.+ (str.to.re "888"))) (re.++ (re.* (re.* (str.to.re "999"))) (re.++ (re.+ (re.union (str.to.re "aaa") (str.to.re "bbb"))) (re.++ (re.+ (re.+ (str.to.re "cc"))) (re.* (re.* (str.to.re "d"))))))))))))))
(assert (<= 426 (str.len var0)))
(check-sat)
