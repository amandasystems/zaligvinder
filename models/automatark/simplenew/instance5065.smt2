(declare-const X String)
; ^[\d]{1,}?\.[\d]{2}$
(assert (str.in.re X (re.++ (re.+ (re.range "0" "9")) (str.to.re ".") ((_ re.loop 2 2) (re.range "0" "9")) (str.to.re "\x0a"))))
(check-sat)
