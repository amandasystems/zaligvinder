(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.+ (re.* (str.to.re "0"))) (re.++ (re.union (re.union (str.to.re "111") (str.to.re "22")) (re.union (str.to.re "33") (str.to.re "4"))) (re.++ (re.* (re.union (str.to.re "555") (str.to.re "66"))) (re.++ (re.union (re.union (str.to.re "777") (str.to.re "888")) (re.+ (str.to.re "999"))) (re.++ (re.* (re.union (str.to.re "aaa") (str.to.re "b"))) (re.++ (re.+ (re.* (str.to.re "cc"))) (re.++ (re.union (re.union (str.to.re "ddd") (str.to.re "eee")) (re.* (str.to.re "fff"))) (re.++ (re.+ (re.+ (str.to.re "gg"))) (re.++ (re.union (re.* (str.to.re "hh")) (re.union (str.to.re "ii") (str.to.re "jjj"))) (re.union (re.* (str.to.re "k")) (re.* (str.to.re "ll"))))))))))))))
(assert (<= 476 (str.len var0)))
(check-sat)
