(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.+ (re.union (str.to.re "000") (str.to.re "1"))) (re.++ (re.union (re.* (str.to.re "222")) (re.union (str.to.re "3") (str.to.re "44"))) (re.++ (re.+ (re.union (str.to.re "5") (str.to.re "66"))) (re.++ (re.union (re.union (str.to.re "7") (str.to.re "88")) (re.+ (str.to.re "99"))) (re.++ (re.* (re.+ (str.to.re "a"))) (re.++ (re.union (re.union (str.to.re "bb") (str.to.re "ccc")) (re.* (str.to.re "dd"))) (re.++ (re.+ (re.union (str.to.re "eee") (str.to.re "f"))) (re.++ (re.+ (re.+ (str.to.re "ggg"))) (re.++ (re.+ (re.union (str.to.re "hh") (str.to.re "i"))) (re.union (re.+ (re.+ (re.* (re.* re.allchar)))) (re.* (str.to.re "kk"))))))))))))))
(assert (<= 451 (str.len var0)))
(check-sat)
