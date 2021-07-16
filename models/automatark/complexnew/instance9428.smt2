(declare-const X String)
; ^(([0]?[1-9]|1[0-2])/([0-2]?[0-9]|3[0-1])/[1-2]\d{3})? ?((([0-1]?\d)|(2[0-3])):[0-5]\d)?(:[0-5]\d)? ?(AM|am|PM|pm)?$
(assert (str.in.re X (re.++ (re.opt (re.++ (re.union (re.++ (re.opt (str.to.re "0")) (re.range "1" "9")) (re.++ (str.to.re "1") (re.range "0" "2"))) (str.to.re "/") (re.union (re.++ (re.opt (re.range "0" "2")) (re.range "0" "9")) (re.++ (str.to.re "3") (re.range "0" "1"))) (str.to.re "/") (re.range "1" "2") ((_ re.loop 3 3) (re.range "0" "9")))) (re.opt (str.to.re " ")) (re.opt (re.++ (re.union (re.++ (re.opt (re.range "0" "1")) (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "3"))) (str.to.re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt (re.++ (str.to.re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt (str.to.re " ")) (re.opt (re.union (str.to.re "AM") (str.to.re "am") (str.to.re "PM") (str.to.re "pm"))) (str.to.re "\x0a"))))
; -[0-9]*[x][0-9]*
(assert (str.in.re X (re.++ (str.to.re "-") (re.* (re.range "0" "9")) (str.to.re "x") (re.* (re.range "0" "9")) (str.to.re "\x0a"))))
(check-sat)
