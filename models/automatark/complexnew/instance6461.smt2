(declare-const X String)
; /u=[\dA-Fa-f]{8}/smiU
(assert (str.in.re X (re.++ (str.to.re "/u=") ((_ re.loop 8 8) (re.union (re.range "0" "9") (re.range "A" "F") (re.range "a" "f"))) (str.to.re "/smiU\x0a"))))
; ^[0-9]*[1-9]+[0-9]*$
(assert (not (str.in.re X (re.++ (re.* (re.range "0" "9")) (re.+ (re.range "1" "9")) (re.* (re.range "0" "9")) (str.to.re "\x0a")))))
(check-sat)
