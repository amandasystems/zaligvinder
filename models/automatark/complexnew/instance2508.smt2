(declare-const X String)
; \D
(assert (not (str.in.re X (re.++ (re.comp (re.range "0" "9")) (str.to.re "\x0a")))))
; ^(Function|Sub)(\s+[\w]+)\([^\(\)]*\)
(assert (not (str.in.re X (re.++ (re.union (str.to.re "Function") (str.to.re "Sub")) (str.to.re "(") (re.* (re.union (str.to.re "(") (str.to.re ")"))) (str.to.re ")\x0a") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_")))))))
; ^[^']*$
(assert (not (str.in.re X (re.++ (re.* (re.comp (str.to.re "'"))) (str.to.re "\x0a")))))
; ^([0-9A-Za-z@.]{1,255})$
(assert (not (str.in.re X (re.++ ((_ re.loop 1 255) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "@") (str.to.re "."))) (str.to.re "\x0a")))))
; ^((\d[-. ]?)?((\(\d{3}\))|\d{3}))?[-. ]?\d{3}[-. ]?\d{4}$
(assert (str.in.re X (re.++ (re.opt (re.++ (re.opt (re.++ (re.range "0" "9") (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))))) (re.union (re.++ (str.to.re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re ")")) ((_ re.loop 3 3) (re.range "0" "9"))))) (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to.re "\x0a"))))
(check-sat)
