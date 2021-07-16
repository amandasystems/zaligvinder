(declare-const X String)
; ( xmlns:.*=[",'].*[",'])|( xmlns=[",'].*[",'])
(assert (str.in.re X (re.union (re.++ (str.to.re " xmlns:") (re.* re.allchar) (str.to.re "=") (re.union (str.to.re "\x22") (str.to.re ",") (str.to.re "'")) (re.* re.allchar) (re.union (str.to.re "\x22") (str.to.re ",") (str.to.re "'"))) (re.++ (str.to.re "\x0a xmlns=") (re.union (str.to.re "\x22") (str.to.re ",") (str.to.re "'")) (re.* re.allchar) (re.union (str.to.re "\x22") (str.to.re ",") (str.to.re "'"))))))
; ^(GIR|[A-Z]\d[A-Z\d]??|[A-Z]{2}\d[A-Z\d]??)[ ]??(\d[A-Z]{2})$
(assert (not (str.in.re X (re.++ (re.union (str.to.re "GIR") (re.++ (re.range "A" "Z") (re.range "0" "9") (re.opt (re.union (re.range "A" "Z") (re.range "0" "9")))) (re.++ ((_ re.loop 2 2) (re.range "A" "Z")) (re.range "0" "9") (re.opt (re.union (re.range "A" "Z") (re.range "0" "9"))))) (re.opt (str.to.re " ")) (str.to.re "\x0a") (re.range "0" "9") ((_ re.loop 2 2) (re.range "A" "Z"))))))
; ^\d{2}[0-1][0-9][0-3][0-9]-{0,1}\d{2}-{0,1}\d{4}$
(assert (str.in.re X (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.range "0" "1") (re.range "0" "9") (re.range "0" "3") (re.range "0" "9") (re.opt (str.to.re "-")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to.re "-")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to.re "\x0a"))))
; www\x2Edotcomtoolbar\x2Ecom\d+DesktopAddressIDENTIFY
(assert (str.in.re X (re.++ (str.to.re "www.dotcomtoolbar.com") (re.+ (re.range "0" "9")) (str.to.re "DesktopAddressIDENTIFY\x0a"))))
(check-sat)
