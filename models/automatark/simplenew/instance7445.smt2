(declare-const X String)
; ^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$
(assert (str.in.re X (re.++ (re.opt (str.to.re "$")) (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to.re ",") (re.* (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re ","))) ((_ re.loop 3 3) (re.range "0" "9"))) (re.+ (re.range "0" "9"))) (re.opt (re.++ re.allchar (re.range "0" "9") (re.range "0" "9"))) (str.to.re "\x0a"))))
(check-sat)
