(declare-const X String)
; ^#?(([a-fA-F0-9]{3}){1,2})$
(assert (str.in.re X (re.++ (re.opt (str.to.re "#")) ((_ re.loop 1 2) ((_ re.loop 3 3) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9")))) (str.to.re "\x0a"))))
; ^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$
(assert (not (str.in.re X (re.++ (re.union (str.to.re "0") (str.to.re "+33")) (re.range "1" "9") ((_ re.loop 4 4) (re.++ (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 2 2) (re.range "0" "9")))) (str.to.re "\x0a")))))
; ^1?[1-2]$|^[1-9]$|^[1]0$
(assert (str.in.re X (re.union (re.++ (re.opt (str.to.re "1")) (re.range "1" "2")) (re.range "1" "9") (str.to.re "10\x0a"))))
(check-sat)
