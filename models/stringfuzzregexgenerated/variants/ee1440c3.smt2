(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.+ (re.* (str.to.re "000"))) (re.++ (re.+ (re.* (str.to.re "11"))) (re.++ (re.* (re.union (str.to.re "2") (str.to.re "333"))) (re.++ (re.+ (re.+ (str.to.re "4"))) (re.++ (re.* (re.* (str.to.re "555"))) (re.++ (re.union (re.union (str.to.re "666") (str.to.re "7")) (re.+ (str.to.re "8"))) (re.++ (re.+ (re.+ (str.to.re "9"))) (re.++ (re.+ (re.* (str.to.re "a"))) (re.++ (re.union (re.+ (str.to.re "bb")) (re.+ (str.to.re "c"))) (re.* (re.++ (str.to.re "d") (str.to.re "d"))))))))))))))
(assert (<= 451 (str.len var0)))
(check-sat)
