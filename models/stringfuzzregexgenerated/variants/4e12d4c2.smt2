(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.union (str.to.re "00") (str.to.re "1")) (re.* (str.to.re "2"))) (re.++ (re.* (re.* (str.to.re "33"))) (re.++ (re.* (re.union (str.to.re "444") (str.to.re "555"))) (re.++ (re.+ (re.* (str.to.re "6"))) (re.++ (re.union (re.union (str.to.re "777") (str.to.re "888")) (re.+ (str.to.re "9"))) (re.++ (re.* (re.* (str.to.re "aa"))) (re.++ (re.union (re.union (str.to.re "bb") (str.to.re "c")) (re.+ (str.to.re "dd"))) (re.++ (re.+ (re.* (str.to.re "e"))) (re.++ (re.+ (re.+ (str.to.re "ff"))) (re.* (re.union (str.to.re "ggg") (re.++ (re.++ (str.to.re "") (str.to.re "")) (re.* (re.* (re.* re.allchar)))))))))))))))))
(assert (<= 301 (str.len var0)))
(check-sat)
