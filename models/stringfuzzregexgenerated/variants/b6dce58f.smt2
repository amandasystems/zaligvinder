(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.* (str.to.re "000"))) (re.++ (re.* (re.union (str.to.re "11") (str.to.re "22"))) (re.++ (re.union (re.+ (str.to.re "33")) (re.* (str.to.re "44"))) (re.++ (re.union (re.* (str.to.re "5")) (re.* (str.to.re "6"))) (re.++ (re.+ (re.* (str.to.re "77"))) (re.++ (re.* (re.+ (str.to.re "888"))) (re.++ (re.* (re.* (str.to.re "9"))) (re.++ (re.union (re.union (str.to.re "aa") (str.to.re "bb")) (re.+ (str.to.re "c"))) (re.++ (re.* (re.union (str.to.re "d") (str.to.re "eee"))) (re.union (re.+ (str.to.re "f")) (re.union (re.+ (re.+ (re.++ (re.+ re.allchar) (re.* re.allchar)))) (str.to.re "h"))))))))))))))
(assert (<= 351 (str.len var0)))
(check-sat)
