(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.+ (str.to.re "000"))) (re.++ (re.union (re.+ (str.to.re "1")) (re.union (str.to.re "22") (str.to.re "333"))) (re.++ (re.* (re.+ (str.to.re "444"))) (re.++ (re.union (re.* (str.to.re "555")) (re.+ (str.to.re "6"))) (re.++ (re.* (re.union (str.to.re "777") (str.to.re "888"))) (re.++ (re.union (re.* (str.to.re "9")) (re.* (str.to.re "aaa"))) (re.++ (re.* (re.union (str.to.re "bbb") (str.to.re "cc"))) (re.++ (re.union (re.+ (str.to.re "d")) (re.union (str.to.re "e") (str.to.re "ff"))) (re.++ (re.* (re.* (str.to.re "g"))) (re.+ (re.+ (str.to.re "hh"))))))))))))))
(assert (<= 351 (str.len var0)))
(check-sat)
