(declare-const X String)
; ^([^\s]){5,12}$
(assert (not (str.in.re X (re.++ ((_ re.loop 5 12) (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "\x0a")))))
; ^([6011]{4})([0-9]{12})$
(assert (not (str.in.re X (re.++ ((_ re.loop 4 4) (re.union (str.to.re "6") (str.to.re "0") (str.to.re "1"))) ((_ re.loop 12 12) (re.range "0" "9")) (str.to.re "\x0a")))))
; ^[^\s]+@[^\.][^\s]{1,}\.[A-Za-z]{2,10}$
(assert (not (str.in.re X (re.++ (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "@") (re.comp (str.to.re ".")) (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re ".") ((_ re.loop 2 10) (re.union (re.range "A" "Z") (re.range "a" "z"))) (str.to.re "\x0a")))))
(check-sat)
