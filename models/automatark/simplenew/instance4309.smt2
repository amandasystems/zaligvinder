(declare-const X String)
; \bfor\b.*[A-Za-z][<> ][\d]
(assert (not (str.in.re X (re.++ (str.to.re "for") (re.* re.allchar) (re.union (re.range "A" "Z") (re.range "a" "z")) (re.union (str.to.re "<") (str.to.re ">") (str.to.re " ")) (re.range "0" "9") (str.to.re "\x0a")))))
(check-sat)
