(declare-const X String)
; ([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$
(assert (not (str.in.re X (re.++ (str.to.re "\x0a") (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z")) (re.* (re.++ (re.* (re.union (str.to.re "-") (str.to.re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z")))) (str.to.re "@") (re.+ (re.++ (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z")) (re.* (re.union (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z")) (str.to.re "."))) ((_ re.loop 2 9) (re.union (re.range "a" "z") (re.range "A" "Z")))))))
; ^[0-9]*(\.)?[0-9]+$
(assert (str.in.re X (re.++ (re.* (re.range "0" "9")) (re.opt (str.to.re ".")) (re.+ (re.range "0" "9")) (str.to.re "\x0a"))))
(check-sat)
