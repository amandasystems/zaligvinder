(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.* (str.to.re "0")) (re.* (str.to.re "1"))) (re.++ (re.union (re.+ (str.to.re "2")) (re.* (str.to.re "3"))) (re.++ (re.union (re.+ (str.to.re "4")) (re.+ (str.to.re "555"))) (re.++ (re.+ (re.* (str.to.re "666"))) (re.++ (re.* (re.+ (str.to.re "77"))) (re.++ (re.* (re.+ (str.to.re "888"))) (re.++ (re.* (re.+ (str.to.re "999"))) (re.++ (re.union (re.union (str.to.re "aaa") (str.to.re "bbb")) (re.+ (str.to.re "cc"))) (re.++ (re.+ (re.+ (str.to.re "dd"))) (re.+ (re.+ (str.to.re "e"))))))))))))))
(assert (<= 451 (str.len var0)))
(check-sat)
