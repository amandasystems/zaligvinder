(declare-const X String)
; /((\d){2})?(\s|-)?((\d){2,4})?(\s|-){1}((\d){8})$/
(assert (not (str.in.re X (re.++ (str.to.re "/") (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (re.opt (re.union (str.to.re "-") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.opt ((_ re.loop 2 4) (re.range "0" "9"))) ((_ re.loop 1 1) (re.union (str.to.re "-") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 8 8) (re.range "0" "9")) (str.to.re "/\x0a")))))
(check-sat)
