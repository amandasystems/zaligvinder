(declare-const X String)
; \A(.*?)\s+(\d+[a-zA-Z]{0,1}\s{0,1}[-]{1}\s{0,1}\d*[a-zA-Z]{0,1}|\d+[a-zA-Z-]{0,1}\d*[a-zA-Z]{0,1})
(assert (str.in.re X (re.++ (re.* re.allchar) (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.union (re.++ (re.+ (re.range "0" "9")) (re.opt (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 1 1) (str.to.re "-")) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.* (re.range "0" "9")) (re.opt (re.union (re.range "a" "z") (re.range "A" "Z")))) (re.++ (re.+ (re.range "0" "9")) (re.opt (re.union (re.range "a" "z") (re.range "A" "Z") (str.to.re "-"))) (re.* (re.range "0" "9")) (re.opt (re.union (re.range "a" "z") (re.range "A" "Z"))))) (str.to.re "\x0a"))))
; /filename=[^\n]*\x2equo/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".quo/i\x0a"))))
(check-sat)
