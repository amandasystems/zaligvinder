(declare-const X String)
; ^\d+([.,]?\d+)?$
(assert (not (str.in.re X (re.++ (re.+ (re.range "0" "9")) (re.opt (re.++ (re.opt (re.union (str.to.re ".") (str.to.re ","))) (re.+ (re.range "0" "9")))) (str.to.re "\x0a")))))
(check-sat)
