(declare-const X String)
; ^\d{3,3}\.\d{0,2}$|^E\d{3,3}\.\d{0,2}$
(assert (not (str.in.re X (re.union (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re ".") ((_ re.loop 0 2) (re.range "0" "9"))) (re.++ (str.to.re "E") ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re ".") ((_ re.loop 0 2) (re.range "0" "9")) (str.to.re "\x0a"))))))
(check-sat)
