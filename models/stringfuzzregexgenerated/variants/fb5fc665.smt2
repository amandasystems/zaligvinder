(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.union (str.to.re "0") (str.to.re "11"))) (re.++ (re.union (re.+ (str.to.re "22")) (re.union (str.to.re "333") (str.to.re "44"))) (re.++ (re.union (re.* (str.to.re "555")) (re.* (str.to.re "666"))) (re.++ (re.* (re.* (str.to.re "7"))) (re.++ (re.+ (re.+ (str.to.re "888"))) (re.++ (re.* (re.+ (str.to.re "9"))) (re.++ (re.* (re.* (str.to.re "aa"))) (re.++ (re.union (re.* (str.to.re "b")) (re.+ (str.to.re "c"))) (re.++ (re.union (re.+ (str.to.re "dd")) (re.union (str.to.re "ee") (str.to.re "fff"))) (re.union (re.+ (str.to.re "g")) (re.+ (re.++ (re.++ (re.+ re.allchar) (re.* re.allchar)) (re.++ (re.+ (re.* re.allchar)) (re.* re.allchar))))))))))))))))
(assert (<= 251 (str.len var0)))
(check-sat)
