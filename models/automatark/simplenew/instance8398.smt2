(declare-const X String)
; ^[a-z]
(assert (str.in.re X (re.++ (re.range "a" "z") (str.to.re "\x0a"))))
(check-sat)
