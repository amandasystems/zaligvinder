(declare-const X String)
; ^[1-9]\d$
(assert (str.in.re X (re.++ (re.range "1" "9") (re.range "0" "9") (str.to.re "\x0a"))))
(check-sat)
