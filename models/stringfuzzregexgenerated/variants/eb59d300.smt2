(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.+ (str.to.re "0"))) (re.++ (re.+ (re.union (str.to.re "1") (str.to.re "222"))) (re.++ (re.* (re.+ (str.to.re "3"))) (re.++ (re.* (re.union (str.to.re "44") (str.to.re "55"))) (re.++ (re.union (re.union (str.to.re "66") (str.to.re "7")) (re.union (str.to.re "888") (str.to.re "999"))) (re.++ (re.* (re.union (str.to.re "aaa") (str.to.re "bb"))) (re.++ (re.union (re.union (str.to.re "ccc") (str.to.re "dd")) (re.* (str.to.re "ee"))) (re.++ (re.+ (re.union (str.to.re "f") (str.to.re "g"))) (re.++ (re.union (re.union (str.to.re "hh") (str.to.re "i")) (re.+ (str.to.re "jj"))) (re.+ (re.++ (str.to.re "kkk") (str.to.re "kkk"))))))))))))))
(assert (<= 326 (str.len var0)))
(check-sat)
