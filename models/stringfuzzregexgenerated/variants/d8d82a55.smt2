(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.union (str.to.re "0") (str.to.re "111")) (re.* (str.to.re "222"))) (re.++ (re.* (re.+ (str.to.re "333"))) (re.++ (re.+ (re.union (str.to.re "44") (str.to.re "55"))) (re.++ (re.+ (re.union (str.to.re "666") (str.to.re "777"))) (re.++ (re.+ (re.union (str.to.re "8") (str.to.re "999"))) (re.++ (re.+ (re.* (str.to.re "a"))) (re.++ (re.union (re.* (str.to.re "bbb")) (re.+ (str.to.re "ccc"))) (re.++ (re.* (re.* (str.to.re "ddd"))) (re.++ (re.union (re.union (str.to.re "eee") (str.to.re "ff")) (re.union (str.to.re "ggg") (str.to.re "h"))) (re.* (re.++ (str.to.re "i") (str.to.re "i"))))))))))))))
(assert (<= 326 (str.len var0)))
(check-sat)
