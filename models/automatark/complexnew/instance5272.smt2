(declare-const X String)
; ^([A-Z]{2}[9]{3}|[A-Z]{3}[9]{2}|[A-Z]{4}[9]{1}|[A-Z]{5})[0-9]{6}([A-Z]{1}[9]{1}|[A-Z]{2})[A-Z0-9]{3}[0-9]{2}$
(assert (str.in.re X (re.++ (re.union (re.++ ((_ re.loop 2 2) (re.range "A" "Z")) ((_ re.loop 3 3) (str.to.re "9"))) (re.++ ((_ re.loop 3 3) (re.range "A" "Z")) ((_ re.loop 2 2) (str.to.re "9"))) (re.++ ((_ re.loop 4 4) (re.range "A" "Z")) ((_ re.loop 1 1) (str.to.re "9"))) ((_ re.loop 5 5) (re.range "A" "Z"))) ((_ re.loop 6 6) (re.range "0" "9")) (re.union (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) ((_ re.loop 1 1) (str.to.re "9"))) ((_ re.loop 2 2) (re.range "A" "Z"))) ((_ re.loop 3 3) (re.union (re.range "A" "Z") (re.range "0" "9"))) ((_ re.loop 2 2) (re.range "0" "9")) (str.to.re "\x0a"))))
; ^[^#]([^ ]+ ){6}[^ ]+$
(assert (str.in.re X (re.++ (re.comp (str.to.re "#")) ((_ re.loop 6 6) (re.++ (re.+ (re.comp (str.to.re " "))) (str.to.re " "))) (re.+ (re.comp (str.to.re " "))) (str.to.re "\x0a"))))
(check-sat)
