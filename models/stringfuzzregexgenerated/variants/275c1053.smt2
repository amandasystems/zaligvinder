(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.union (str.to.re "0") (str.to.re "1")) (re.+ (str.to.re "2"))) (re.++ (re.+ (re.union (str.to.re "33") (str.to.re "44"))) (re.++ (re.* (re.union (str.to.re "5") (str.to.re "6"))) (re.++ (re.union (re.union (str.to.re "77") (str.to.re "88")) (re.union (str.to.re "999") (str.to.re "aaa"))) (re.++ (re.union (re.+ (str.to.re "b")) (re.+ (str.to.re "cc"))) (re.++ (re.* (re.* (str.to.re "d"))) (re.++ (re.+ (re.+ (str.to.re "ee"))) (re.++ (re.+ (re.+ (str.to.re "fff"))) (re.++ (re.union (re.union (str.to.re "gg") (str.to.re "hh")) (re.+ (str.to.re "ii"))) (re.union (re.union (str.to.re "j") (str.to.re "kkk")) (re.++ (str.to.re "ll") (str.to.re "ll"))))))))))))))
(assert (<= 426 (str.len var0)))
(check-sat)
