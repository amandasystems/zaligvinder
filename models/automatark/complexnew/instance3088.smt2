(declare-const X String)
; A-311Host\x3Alnzzlnbk\x2fpkrm\.finSubject\x3a
(assert (not (str.in.re X (str.to.re "A-311Host:lnzzlnbk/pkrm.finSubject:\x0a"))))
; /^full\x7c\d+\x7c\d+\x7C[a-z0-9]+\x2E[a-z]{2,3}\x7C[a-z0-9]+\x7C/
(assert (str.in.re X (re.++ (str.to.re "/full|") (re.+ (re.range "0" "9")) (str.to.re "|") (re.+ (re.range "0" "9")) (str.to.re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to.re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to.re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to.re "|/\x0a"))))
(check-sat)
