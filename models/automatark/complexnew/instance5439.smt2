(declare-const X String)
; /filename=[^\n]*\x2eoga/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".oga/i\x0a"))))
; ^((5)/(1|2|5)/([0-9])/([0-9])/([0-9])/([0-9])/([0-9])/([0-9])/([2-9]))$
(assert (not (str.in.re X (re.++ (str.to.re "\x0a5/") (re.union (str.to.re "1") (str.to.re "2") (str.to.re "5")) (str.to.re "/") (re.range "0" "9") (str.to.re "/") (re.range "0" "9") (str.to.re "/") (re.range "0" "9") (str.to.re "/") (re.range "0" "9") (str.to.re "/") (re.range "0" "9") (str.to.re "/") (re.range "0" "9") (str.to.re "/") (re.range "2" "9")))))
; ^((\d{8})|(\d{10})|(\d{11})|(\d{6}-\d{5}))?$
(assert (str.in.re X (re.++ (re.opt (re.union ((_ re.loop 8 8) (re.range "0" "9")) ((_ re.loop 10 10) (re.range "0" "9")) ((_ re.loop 11 11) (re.range "0" "9")) (re.++ ((_ re.loop 6 6) (re.range "0" "9")) (str.to.re "-") ((_ re.loop 5 5) (re.range "0" "9"))))) (str.to.re "\x0a"))))
; ^([\w-]+\.)*?[\w-]+@[\w-]+\.([\w-]+\.)*?[\w]+$
(assert (str.in.re X (re.++ (re.* (re.++ (re.+ (re.union (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "."))) (re.+ (re.union (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "@") (re.+ (re.union (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re ".") (re.* (re.++ (re.+ (re.union (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "."))) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x0a"))))
; searches\x2Eworldtostart\x2Ecom\w+searchreslt\x7D\x7BSysuptime\x3A
(assert (not (str.in.re X (re.++ (str.to.re "searches.worldtostart.com") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "searchreslt}{Sysuptime:\x0a")))))
(check-sat)
