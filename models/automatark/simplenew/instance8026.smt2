(declare-const X String)
; ^([01][012]|0[1-9])/([0-2][0-9]|[3][0-1])/([0-9][0-9][0-9][0-9])$
(assert (not (str.in.re X (re.++ (re.union (re.++ (re.union (str.to.re "0") (str.to.re "1")) (re.union (str.to.re "0") (str.to.re "1") (str.to.re "2"))) (re.++ (str.to.re "0") (re.range "1" "9"))) (str.to.re "/") (re.union (re.++ (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to.re "3") (re.range "0" "1"))) (str.to.re "/\x0a") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9")))))
(check-sat)
