(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.union (str.to.re "0") (str.to.re "1")) (re.* (str.to.re "22"))) (re.++ (re.+ (re.* (str.to.re "3"))) (re.++ (re.* (re.+ (str.to.re "444"))) (re.++ (re.union (re.* (str.to.re "555")) (re.+ (str.to.re "66"))) (re.++ (re.union (re.* (str.to.re "77")) (re.+ (str.to.re "888"))) (re.++ (re.* (re.union (str.to.re "9") (str.to.re "a"))) (re.++ (re.union (re.+ (str.to.re "bb")) (re.union (str.to.re "cc") (str.to.re "dd"))) (re.++ (re.union (re.+ (str.to.re "ee")) (re.union (str.to.re "fff") (str.to.re "g"))) (re.++ (re.* (re.+ (str.to.re "hhh"))) (re.* (re.* (str.to.re "iii"))))))))))))))
(assert (<= 476 (str.len var0)))
(check-sat)
