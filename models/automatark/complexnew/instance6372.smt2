(declare-const X String)
; <!*[^<>]*>
(assert (str.in.re X (re.++ (str.to.re "<") (re.* (str.to.re "!")) (re.* (re.union (str.to.re "<") (str.to.re ">"))) (str.to.re ">\x0a"))))
; ^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$
(assert (str.in.re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.union (str.to.re ".") (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")) (str.to.re "@") (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")) (re.* (re.union (str.to.re ".") (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")) (str.to.re ".") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (str.to.re "."))) (re.union (re.range "a" "z") (re.range "A" "Z")) (str.to.re "\x0a"))))
; ^(\w+)s?\:\/\/(\w+)?(\.)?(\w+)?\.(\w+)$
(assert (not (str.in.re X (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.opt (str.to.re "s")) (str.to.re "://") (re.opt (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_")))) (re.opt (str.to.re ".")) (re.opt (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_")))) (str.to.re ".") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x0a")))))
; sql.*badurl\x2Egrandstreetinteractive\x2Ecom
(assert (str.in.re X (re.++ (str.to.re "sql") (re.* re.allchar) (str.to.re "badurl.grandstreetinteractive.com\x0a"))))
(check-sat)
