(declare-const X String)
; ^[^\\\/\?\*\"\>\<\:\|]*$
(assert (str.in.re X (re.++ (re.* (re.union (str.to.re "\x5c") (str.to.re "/") (str.to.re "?") (str.to.re "*") (str.to.re "\x22") (str.to.re ">") (str.to.re "<") (str.to.re ":") (str.to.re "|"))) (str.to.re "\x0a"))))
(check-sat)
