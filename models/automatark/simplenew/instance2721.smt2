(declare-const X String)
; ^([0-9]{1,2},([0-9]{2},)*[0-9]{3}|[0-9]+)$
(assert (not (str.in.re X (re.++ (re.union (re.++ ((_ re.loop 1 2) (re.range "0" "9")) (str.to.re ",") (re.* (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to.re ","))) ((_ re.loop 3 3) (re.range "0" "9"))) (re.+ (re.range "0" "9"))) (str.to.re "\x0a")))))
(check-sat)
