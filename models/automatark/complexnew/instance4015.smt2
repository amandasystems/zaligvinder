(declare-const X String)
; /filename=[^\n]*\x2epor/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".por/i\x0a")))))
; ^[0-9]{5}(-[0-9]{4})?$
(assert (str.in.re X (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (re.opt (re.++ (str.to.re "-") ((_ re.loop 4 4) (re.range "0" "9")))) (str.to.re "\x0a"))))
(check-sat)
