(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.union (str.to.re "000") (str.to.re "1"))) (re.++ (re.* (re.* (str.to.re "2"))) (re.++ (re.* (re.+ (str.to.re "3"))) (re.++ (re.union (re.union (str.to.re "44") (str.to.re "555")) (re.+ (str.to.re "666"))) (re.++ (re.* (re.* (str.to.re "77"))) (re.++ (re.* (re.+ (str.to.re "888"))) (re.++ (re.union (re.* (str.to.re "999")) (re.* (str.to.re "aaa"))) (re.++ (re.* (re.union (str.to.re "b") (str.to.re "ccc"))) (re.++ (re.union (re.* (str.to.re "d")) (re.* (str.to.re "eee"))) (re.union (re.+ (str.to.re "f")) (re.* (re.+ (re.++ (str.to.re "") (str.to.re ""))))))))))))))))
(assert (<= 426 (str.len var0)))
(check-sat)
