(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.+ (str.to.re "00")) (re.* (str.to.re "11"))) (re.++ (re.* (re.+ (str.to.re "222"))) (re.++ (re.union (re.* (str.to.re "3")) (re.* (str.to.re "4"))) (re.++ (re.union (re.union (str.to.re "55") (str.to.re "666")) (re.* (str.to.re "777"))) (re.++ (re.+ (re.union (str.to.re "888") (str.to.re "99"))) (re.++ (re.* (re.+ (str.to.re "aaa"))) (re.++ (re.union (re.+ (str.to.re "bb")) (re.union (str.to.re "ccc") (str.to.re "ddd"))) (re.++ (re.* (re.* (str.to.re "eee"))) (re.++ (re.* (re.+ (str.to.re "f"))) (re.union (re.union (str.to.re "gg") (str.to.re "h")) (re.+ (str.to.re "ii"))))))))))))))
(assert (<= 226 (str.len var0)))
(check-sat)
