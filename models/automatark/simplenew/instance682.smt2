(declare-const X String)
; (\d*)'*-*(\d*)/*(\d*)"
(assert (str.in.re X (re.++ (re.* (re.range "0" "9")) (re.* (str.to.re "'")) (re.* (str.to.re "-")) (re.* (re.range "0" "9")) (re.* (str.to.re "/")) (re.* (re.range "0" "9")) (str.to.re "\x22\x0a"))))
(check-sat)
