(declare-const X String)
; Host\x3A\s+offers\x2Ebullseye-network\x2Ecom
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "offers.bullseye-network.com\x0a"))))
; ^\(?\+([9]{2}?[6])\)?[-. ]?([0-9]{3})[-. ]?([0-9]{3})[-. ]?([0-9]{3})$
(assert (not (str.in.re X (re.++ (re.opt (str.to.re "(")) (str.to.re "+") (re.opt (str.to.re ")")) (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "\x0a") ((_ re.loop 2 2) (str.to.re "9")) (str.to.re "6")))))
(check-sat)
