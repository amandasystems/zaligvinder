(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.+ (re.+ (str.to.re "000"))) (re.++ (re.+ (re.union (str.to.re "1") (str.to.re "22"))) (re.++ (re.* (re.* (str.to.re "3"))) (re.++ (re.+ (re.union (str.to.re "4") (str.to.re "555"))) (re.++ (re.* (re.union (str.to.re "6") (str.to.re "7"))) (re.++ (re.union (re.+ (str.to.re "8")) (re.union (str.to.re "99") (str.to.re "aaa"))) (re.++ (re.* (re.+ (str.to.re "bbb"))) (re.++ (re.union (re.union (str.to.re "c") (str.to.re "ddd")) (re.union (str.to.re "eee") (str.to.re "fff"))) (re.++ (re.union (re.* (str.to.re "ggg")) (re.* (str.to.re "hh"))) (re.* (re.+ (str.to.re "i"))))))))))))))
(assert (<= 376 (str.len var0)))
(check-sat)
