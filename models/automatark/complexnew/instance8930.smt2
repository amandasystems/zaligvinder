(declare-const X String)
; [:]{1}[-~+o]?[)>]+
(assert (not (str.in.re X (re.++ ((_ re.loop 1 1) (str.to.re ":")) (re.opt (re.union (str.to.re "-") (str.to.re "~") (str.to.re "+") (str.to.re "o"))) (re.+ (re.union (str.to.re ")") (str.to.re ">"))) (str.to.re "\x0a")))))
; ^([1-9]([0-9])?)(\.(([0])?|([1-9])?|[1]([0-1])?)?)?$
(assert (str.in.re X (re.++ (re.opt (re.++ (str.to.re ".") (re.opt (re.union (re.opt (str.to.re "0")) (re.opt (re.range "1" "9")) (re.++ (str.to.re "1") (re.opt (re.range "0" "1"))))))) (str.to.re "\x0a") (re.range "1" "9") (re.opt (re.range "0" "9")))))
(check-sat)
