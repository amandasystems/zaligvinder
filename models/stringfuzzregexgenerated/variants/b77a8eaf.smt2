(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.+ (str.to.re "00"))) (re.++ (re.+ (re.* (str.to.re "1"))) (re.++ (re.* (re.union (str.to.re "222") (str.to.re "3"))) (re.++ (re.union (re.union (str.to.re "44") (str.to.re "5")) (re.union (str.to.re "666") (str.to.re "777"))) (re.++ (re.union (re.union (str.to.re "8") (str.to.re "9")) (re.+ (str.to.re "a"))) (re.++ (re.* (re.union (str.to.re "bb") (str.to.re "cc"))) (re.++ (re.* (re.union (str.to.re "ddd") (str.to.re "ee"))) (re.++ (re.+ (re.union (str.to.re "fff") (str.to.re "g"))) (re.++ (re.union (re.* (str.to.re "hhh")) (re.+ (str.to.re "i"))) (re.* (re.* (re.* (re.++ (re.+ re.allchar) (re.* re.allchar))))))))))))))))
(assert (<= 426 (str.len var0)))
(check-sat)
