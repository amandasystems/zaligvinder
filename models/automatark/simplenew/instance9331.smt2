(declare-const X String)
; (^\d{1,3}([,]\d{3})*$)|(^\d{1,16}$)
(assert (str.in.re X (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.* (re.++ (str.to.re ",") ((_ re.loop 3 3) (re.range "0" "9"))))) (re.++ ((_ re.loop 1 16) (re.range "0" "9")) (str.to.re "\x0a")))))
(check-sat)
