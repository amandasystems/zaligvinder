(declare-const X String)
; \{[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}\}
(assert (not (str.in.re X (re.++ (str.to.re "{") ((_ re.loop 8 8) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (str.to.re "-") ((_ re.loop 4 4) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (str.to.re "-") ((_ re.loop 4 4) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (str.to.re "-") ((_ re.loop 4 4) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (str.to.re "-") ((_ re.loop 12 12) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (str.to.re "}\x0a")))))
; [0-9A-Za-z]
(assert (not (str.in.re X (re.++ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z")) (str.to.re "\x0a")))))
(check-sat)
