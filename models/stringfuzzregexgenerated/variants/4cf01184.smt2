(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.+ (str.to.re "0")) (re.+ (str.to.re "1"))) (re.++ (re.union (re.union (str.to.re "2") (str.to.re "333")) (re.union (str.to.re "44") (str.to.re "55"))) (re.++ (re.* (re.union (str.to.re "6") (str.to.re "777"))) (re.++ (re.+ (re.+ (str.to.re "88"))) (re.++ (re.+ (re.union (str.to.re "99") (str.to.re "a"))) (re.++ (re.union (re.union (str.to.re "bbb") (str.to.re "cc")) (re.* (str.to.re "dd"))) (re.++ (re.union (re.* (str.to.re "eee")) (re.* (str.to.re "ff"))) (re.++ (re.+ (re.union (str.to.re "g") (str.to.re "hhh"))) (re.++ (re.union (re.* (str.to.re "i")) (re.union (str.to.re "jj") (str.to.re "kk"))) (re.+ (re.++ (str.to.re "l") (str.to.re "l"))))))))))))))
(assert (<= 176 (str.len var0)))
(check-sat)
