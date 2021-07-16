(declare-const X String)
; /\x3d\x3d$/P
(assert (str.in.re X (str.to.re "/==/P\x0a")))
; ^[1-4]\d{3}\/((0?[1-6]\/((3[0-1])|([1-2][0-9])|(0?[1-9])))|((1[0-2]|(0?[7-9]))\/(30|([1-2][0-9])|(0?[1-9]))))$
(assert (not (str.in.re X (re.++ (re.range "1" "4") ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "/") (re.union (re.++ (re.opt (str.to.re "0")) (re.range "1" "6") (str.to.re "/") (re.union (re.++ (str.to.re "3") (re.range "0" "1")) (re.++ (re.range "1" "2") (re.range "0" "9")) (re.++ (re.opt (str.to.re "0")) (re.range "1" "9")))) (re.++ (re.union (re.++ (str.to.re "1") (re.range "0" "2")) (re.++ (re.opt (str.to.re "0")) (re.range "7" "9"))) (str.to.re "/") (re.union (str.to.re "30") (re.++ (re.range "1" "2") (re.range "0" "9")) (re.++ (re.opt (str.to.re "0")) (re.range "1" "9"))))) (str.to.re "\x0a")))))
; ^([30|36|38]{2})([0-9]{12})$
(assert (not (str.in.re X (re.++ ((_ re.loop 2 2) (re.union (str.to.re "3") (str.to.re "0") (str.to.re "|") (str.to.re "6") (str.to.re "8"))) ((_ re.loop 12 12) (re.range "0" "9")) (str.to.re "\x0a")))))
; ('{2})*([^'\r\n]*)('{2})*([^'\r\n]*)('{2})*
(assert (str.in.re X (re.++ (re.* ((_ re.loop 2 2) (str.to.re "'"))) (re.* (re.union (str.to.re "'") (str.to.re "\x0d") (str.to.re "\x0a"))) (re.* ((_ re.loop 2 2) (str.to.re "'"))) (re.* (re.union (str.to.re "'") (str.to.re "\x0d") (str.to.re "\x0a"))) (re.* ((_ re.loop 2 2) (str.to.re "'"))) (str.to.re "\x0a"))))
(check-sat)
