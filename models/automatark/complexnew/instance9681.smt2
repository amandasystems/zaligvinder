(declare-const X String)
; [A-Z][a-zA-Z]+ [A-Z][a-zA-Z]+
(assert (not (str.in.re X (re.++ (re.range "A" "Z") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to.re " ") (re.range "A" "Z") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to.re "\x0a")))))
; ^([A-Z]{2}[\s]|[A-Z]{2})[\w]{2}$
(assert (not (str.in.re X (re.++ (re.union (re.++ ((_ re.loop 2 2) (re.range "A" "Z")) (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 2 2) (re.range "A" "Z"))) ((_ re.loop 2 2) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x0a")))))
; /^\x2F40e800[0-9A-F]{30,}$/Ui
(assert (str.in.re X (re.++ (str.to.re "//40e800/Ui\x0a") ((_ re.loop 30 30) (re.union (re.range "0" "9") (re.range "A" "F"))) (re.* (re.union (re.range "0" "9") (re.range "A" "F"))))))
(check-sat)
