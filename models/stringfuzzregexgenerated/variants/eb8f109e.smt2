(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.union (str.to.re "00") (str.to.re "11"))) (re.++ (re.+ (re.union (str.to.re "222") (str.to.re "333"))) (re.++ (re.+ (re.+ (str.to.re "444"))) (re.++ (re.union (re.* (str.to.re "5")) (re.union (str.to.re "666") (str.to.re "7"))) (re.++ (re.* (re.union (str.to.re "888") (str.to.re "9"))) (re.++ (re.+ (re.* (str.to.re "aa"))) (re.++ (re.+ (re.union (str.to.re "bb") (str.to.re "cc"))) (re.++ (re.* (re.union (str.to.re "ddd") (str.to.re "ee"))) (re.++ (re.* (re.+ (str.to.re "f"))) (re.* (re.* (re.+ (re.* (re.+ (re.++ (str.to.re "") (str.to.re ""))))))))))))))))))
(assert (<= 451 (str.len var0)))
(check-sat)
