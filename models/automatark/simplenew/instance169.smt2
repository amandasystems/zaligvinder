(declare-const X String)
; ^[89]\d{7}$
(assert (not (str.in.re X (re.++ (re.union (str.to.re "8") (str.to.re "9")) ((_ re.loop 7 7) (re.range "0" "9")) (str.to.re "\x0a")))))
(check-sat)
