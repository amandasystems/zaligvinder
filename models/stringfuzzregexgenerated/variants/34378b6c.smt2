(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.union (str.to.re "00") (str.to.re "1"))) (re.++ (re.+ (re.union (str.to.re "22") (str.to.re "3"))) (re.++ (re.* (re.union (str.to.re "444") (str.to.re "55"))) (re.++ (re.union (re.union (str.to.re "666") (str.to.re "7")) (re.* (str.to.re "88"))) (re.++ (re.+ (re.* (str.to.re "999"))) (re.++ (re.union (re.union (str.to.re "aaa") (str.to.re "bbb")) (re.* (str.to.re "cc"))) (re.++ (re.* (re.+ (str.to.re "ddd"))) (re.++ (re.* (re.union (str.to.re "eee") (str.to.re "fff"))) (re.++ (re.+ (re.* (str.to.re "ggg"))) (re.* (re.+ (str.to.re "hh"))))))))))))))
(assert (<= 251 (str.len var0)))
(check-sat)
