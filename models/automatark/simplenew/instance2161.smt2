(declare-const X String)
; ^(\+[0-9]{2,}[0-9]{4,}[0-9]*)(x?[0-9]{1,})?$
(assert (not (str.in.re X (re.++ (re.opt (re.++ (re.opt (str.to.re "x")) (re.+ (re.range "0" "9")))) (str.to.re "\x0a+") (re.* (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")) (re.* (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9")) (re.* (re.range "0" "9"))))))
(check-sat)
