(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.+ (str.to.re "0")) (re.union (str.to.re "111") (str.to.re "2"))) (re.++ (re.+ (re.union (str.to.re "333") (str.to.re "44"))) (re.++ (re.union (re.union (str.to.re "555") (str.to.re "66")) (re.+ (str.to.re "7"))) (re.++ (re.* (re.* (str.to.re "8"))) (re.++ (re.+ (re.+ (str.to.re "999"))) (re.++ (re.union (re.union (str.to.re "aaa") (str.to.re "bb")) (re.* (str.to.re "c"))) (re.++ (re.+ (re.+ (str.to.re "d"))) (re.++ (re.* (re.union (str.to.re "ee") (str.to.re "ff"))) (re.++ (re.union (re.union (str.to.re "ggg") (str.to.re "hh")) (re.union (re.* (re.* (re.* re.allchar))) (str.to.re "jjj"))) (re.* (re.* (str.to.re "kkk"))))))))))))))
(assert (<= 176 (str.len var0)))
(check-sat)
