(declare-const X String)
; /^\s+$|^$/gi
(assert (not (str.in.re X (re.union (re.++ (str.to.re "/") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")))) (str.to.re "/gi\x0a")))))
(check-sat)
