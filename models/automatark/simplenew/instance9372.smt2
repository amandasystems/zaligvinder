(declare-const X String)
; [\w!#$%&&apos;*+./=?`{|}~^-]+@[\d.A-Za-z-]+
(assert (str.in.re X (re.++ (re.+ (re.union (str.to.re "!") (str.to.re "#") (str.to.re "$") (str.to.re "%") (str.to.re "&") (str.to.re "a") (str.to.re "p") (str.to.re "o") (str.to.re "s") (str.to.re ";") (str.to.re "*") (str.to.re "+") (str.to.re ".") (str.to.re "/") (str.to.re "=") (str.to.re "?") (str.to.re "`") (str.to.re "{") (str.to.re "|") (str.to.re "}") (str.to.re "~") (str.to.re "^") (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "@") (re.+ (re.union (re.range "0" "9") (str.to.re ".") (re.range "A" "Z") (re.range "a" "z") (str.to.re "-"))) (str.to.re "\x0a"))))
(check-sat)
