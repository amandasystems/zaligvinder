(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.* (re.* (str.to.re "000"))) (re.++ (re.union (re.union (str.to.re "1") (str.to.re "22")) (re.* (str.to.re "33"))) (re.++ (re.union (re.union (str.to.re "44") (str.to.re "555")) (re.* (str.to.re "6"))) (re.++ (re.union (re.union (str.to.re "777") (str.to.re "888")) (re.union (str.to.re "9") (str.to.re "aaa"))) (re.++ (re.+ (re.* (str.to.re "bb"))) (re.++ (re.union (re.* (str.to.re "cc")) (re.+ (str.to.re "d"))) (re.++ (re.* (re.* (str.to.re "ee"))) (re.++ (re.union (re.+ (str.to.re "fff")) (re.* (str.to.re "gg"))) (re.++ (re.* (re.* (str.to.re "h"))) (re.* (re.* (str.to.re "i"))))))))))))))
(assert (<= 451 (str.len var0)))
(check-sat)
