(declare-const X String)
; ^[^_][a-zA-Z0-9_]+[^_]@{1}[a-z]+[.]{1}(([a-z]{2,3})|([a-z]{2,3}[.]{1}[a-z]{2,3}))$
(assert (not (str.in.re X (re.++ (re.comp (str.to.re "_")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to.re "_"))) (re.comp (str.to.re "_")) ((_ re.loop 1 1) (str.to.re "@")) (re.+ (re.range "a" "z")) ((_ re.loop 1 1) (str.to.re ".")) (re.union ((_ re.loop 2 3) (re.range "a" "z")) (re.++ ((_ re.loop 2 3) (re.range "a" "z")) ((_ re.loop 1 1) (str.to.re ".")) ((_ re.loop 2 3) (re.range "a" "z")))) (str.to.re "\x0a")))))
(check-sat)
