(declare-const X String)
; /filename=[^\n]*\x2exap/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".xap/i\x0a"))))
; ^[1-9]{1}[0-9]{3}-(0[1-9]{1}|1[0-2]{1})-([0-2]{1}[1-9]{1}|3[0-1]{1}) ([0-1]{1}[0-9]{1}|2[0-3]{1}):[0-5]{1}[0-9]{1}:[0-5]{1}[0-9]{1}$
(assert (not (str.in.re X (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "-") (re.union (re.++ (str.to.re "0") ((_ re.loop 1 1) (re.range "1" "9"))) (re.++ (str.to.re "1") ((_ re.loop 1 1) (re.range "0" "2")))) (str.to.re "-") (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "2")) ((_ re.loop 1 1) (re.range "1" "9"))) (re.++ (str.to.re "3") ((_ re.loop 1 1) (re.range "0" "1")))) (str.to.re " ") (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "1")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ (str.to.re "2") ((_ re.loop 1 1) (re.range "0" "3")))) (str.to.re ":") ((_ re.loop 1 1) (re.range "0" "5")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to.re ":") ((_ re.loop 1 1) (re.range "0" "5")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to.re "\x0a")))))
(check-sat)
