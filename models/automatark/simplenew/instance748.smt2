(declare-const X String)
; ^[9]9\d{10}|^[5]\d{10}
(assert (not (str.in.re X (re.union (re.++ (str.to.re "99") ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to.re "5") ((_ re.loop 10 10) (re.range "0" "9")) (str.to.re "\x0a"))))))
(check-sat)
