(declare-const X String)
; ^(|(0\d)|(1[0-2])):(([0-5]\d)):(([0-5]\d))\s([AP]M)$
(assert (str.in.re X (re.++ (re.union (re.++ (str.to.re "0") (re.range "0" "9")) (re.++ (str.to.re "1") (re.range "0" "2"))) (str.to.re "::") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "\x0a") (re.range "0" "5") (re.range "0" "9") (re.range "0" "5") (re.range "0" "9") (re.union (str.to.re "A") (str.to.re "P")) (str.to.re "M"))))
; iepluginBrowsedOVNHost\x3A\x2Fproducts\x2Fspyblocs\x2F
(assert (not (str.in.re X (str.to.re "iepluginBrowsedOVNHost:/products/spyblocs/\x13\x0a"))))
; ^[\w]{1,}$
(assert (not (str.in.re X (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x0a")))))
(check-sat)
