(declare-const X String)
; (^(\d|,)*\.?\d*[1-9]+\d*$)|(^[1-9]+(\d|,)*\.\d*$)|(^[1-9]+(\d|,)*\d*$)
(assert (str.in.re X (re.union (re.++ (re.* (re.union (re.range "0" "9") (str.to.re ","))) (re.opt (str.to.re ".")) (re.* (re.range "0" "9")) (re.+ (re.range "1" "9")) (re.* (re.range "0" "9"))) (re.++ (re.+ (re.range "1" "9")) (re.* (re.union (re.range "0" "9") (str.to.re ","))) (str.to.re ".") (re.* (re.range "0" "9"))) (re.++ (str.to.re "\x0a") (re.+ (re.range "1" "9")) (re.* (re.union (re.range "0" "9") (str.to.re ","))) (re.* (re.range "0" "9"))))))
(check-sat)
