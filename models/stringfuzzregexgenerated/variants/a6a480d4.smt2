(declare-fun var0 () String)
(assert (str.in.re var0 (re.++ (re.union (re.union (str.to.re "0") (str.to.re "1")) (re.+ (str.to.re "222"))) (re.++ (re.+ (re.union (str.to.re "333") (str.to.re "4"))) (re.++ (re.union (re.+ (str.to.re "555")) (re.union (str.to.re "6") (str.to.re "777"))) (re.++ (re.union (re.* (str.to.re "888")) (re.union (str.to.re "99") (str.to.re "aaa"))) (re.++ (re.+ (re.+ (str.to.re "bb"))) (re.++ (re.union (re.+ (str.to.re "c")) (re.union (str.to.re "d") (str.to.re "e"))) (re.++ (re.+ (re.+ (str.to.re "fff"))) (re.++ (re.union (re.+ (str.to.re "gg")) (re.+ (str.to.re "h"))) (re.++ (re.union (re.* (str.to.re "ii")) (re.union (str.to.re "j") (str.to.re "k"))) (re.+ (re.* (str.to.re "l"))))))))))))))
(assert (<= 376 (str.len var0)))
(check-sat)
