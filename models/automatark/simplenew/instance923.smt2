(declare-const X String)
; \.([A-Za-z0-9]{2,5}($|\b\?))
(assert (not (str.in.re X (re.++ (str.to.re ".\x0a") ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))) (str.to.re "?")))))
(check-sat)
