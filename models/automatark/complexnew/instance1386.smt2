(declare-const X String)
; /\x2ereg([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.reg") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
; ^([0-9]{4})([0-9]{5})([0-9]{1})$
(assert (not (str.in.re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) ((_ re.loop 5 5) (re.range "0" "9")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to.re "\x0a")))))
; ^\D{0,2}[0]{0,3}[1]{0,1}\D{0,2}([2-9])(\d{2})\D{0,2}(\d{3})\D{0,2}(\d{3})\D{0,2}(\d{1})\D{0,2}$
(assert (not (str.in.re X (re.++ ((_ re.loop 0 2) (re.comp (re.range "0" "9"))) ((_ re.loop 0 3) (str.to.re "0")) (re.opt (str.to.re "1")) ((_ re.loop 0 2) (re.comp (re.range "0" "9"))) (re.range "2" "9") ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 0 2) (re.comp (re.range "0" "9"))) ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 0 2) (re.comp (re.range "0" "9"))) ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 0 2) (re.comp (re.range "0" "9"))) ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 0 2) (re.comp (re.range "0" "9"))) (str.to.re "\x0a")))))
(check-sat)
