(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.* (str.to.re "0"))) (re.++ (re.* (re.union (str.to.re "111") (str.to.re "22"))) (re.++ (re.+ (re.+ (str.to.re "333"))) (re.++ (re.+ (re.+ (str.to.re "444"))) (re.++ (re.* (re.union (str.to.re "5") (str.to.re "6"))) (re.++ (re.union (re.union (str.to.re "77") (str.to.re "888")) (re.+ (str.to.re "999"))) (re.++ (re.+ (re.union (str.to.re "aa") (str.to.re "b"))) (re.++ (re.+ (re.* (str.to.re "ccc"))) (re.++ (re.+ (re.* (str.to.re "dd"))) (re.union (re.+ (str.to.re "e")) (re.union (re.+ (re.++ (re.+ (re.++ (str.to.re "") (str.to.re ""))) (re.+ re.allchar))) (str.to.re "gg"))))))))))))))
(assert (<= 201 (str.len var0)))
(check-sat)
