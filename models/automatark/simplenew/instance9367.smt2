(declare-const X String)
; ('((\\.)|[^\\'])*')
(assert (not (str.in.re X (re.++ (str.to.re "\x0a'") (re.* (re.union (re.++ (str.to.re "\x5c") re.allchar) (str.to.re "\x5c") (str.to.re "'"))) (str.to.re "'")))))
(check-sat)
