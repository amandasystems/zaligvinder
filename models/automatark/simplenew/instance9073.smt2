(declare-const X String)
; (^0.*[1-9]*)|(^860+)|(^8613)|(\D)|([0-9])
(assert (not (str.in.re X (re.union (re.++ (str.to.re "0") (re.* re.allchar) (re.* (re.range "1" "9"))) (re.++ (str.to.re "86") (re.+ (str.to.re "0"))) (str.to.re "8613") (re.comp (re.range "0" "9")) (re.++ (re.range "0" "9") (str.to.re "\x0a"))))))
(check-sat)
