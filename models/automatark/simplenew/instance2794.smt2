(declare-const X String)
; /\/DES\d+O\d+\.jsp\?[a-z0-9=\x2b\x2f]{20}/iU
(assert (str.in.re X (re.++ (str.to.re "//DES") (re.+ (re.range "0" "9")) (str.to.re "O") (re.+ (re.range "0" "9")) (str.to.re ".jsp?") ((_ re.loop 20 20) (re.union (re.range "a" "z") (re.range "0" "9") (str.to.re "=") (str.to.re "+") (str.to.re "/"))) (str.to.re "/iU\x0a"))))
(check-sat)
