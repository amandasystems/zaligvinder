(declare-const X String)
; ^(\d{1,3},)?(\d{3},)+\d{3}(\.\d*)?$|^(\d*)(\.\d*)?$
(assert (str.in.re X (re.union (re.++ (re.opt (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to.re ","))) (re.+ (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re ","))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.++ (str.to.re ".") (re.* (re.range "0" "9"))))) (re.++ (re.* (re.range "0" "9")) (re.opt (re.++ (str.to.re ".") (re.* (re.range "0" "9")))) (str.to.re "\x0a")))))
(check-sat)
