(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.* (str.to.re "000"))) (re.++ (re.union (re.* (str.to.re "11")) (re.* (str.to.re "22"))) (re.++ (re.union (re.union (str.to.re "3") (str.to.re "4")) (re.+ (str.to.re "5"))) (re.++ (re.union (re.+ (str.to.re "6")) (re.union (str.to.re "77") (str.to.re "8"))) (re.++ (re.union (re.+ (str.to.re "99")) (re.union (str.to.re "aa") (str.to.re "bbb"))) (re.++ (re.union (re.union (str.to.re "ccc") (str.to.re "dd")) (re.union (str.to.re "ee") (str.to.re "f"))) (re.++ (re.+ (re.* (str.to.re "g"))) (re.++ (re.* (re.* (str.to.re "hh"))) (re.++ (re.+ (re.* (str.to.re "ii"))) (re.++ (re.* (str.to.re "j")) (re.* (str.to.re "j"))))))))))))))
(assert (<= 426 (str.len var0)))
(check-sat)
