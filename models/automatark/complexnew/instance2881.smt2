(declare-const X String)
; ^\#?[A-Fa-f0-9]{3}([A-Fa-f0-9]{3})?$
(assert (not (str.in.re X (re.++ (re.opt (str.to.re "#")) ((_ re.loop 3 3) (re.union (re.range "A" "F") (re.range "a" "f") (re.range "0" "9"))) (re.opt ((_ re.loop 3 3) (re.union (re.range "A" "F") (re.range "a" "f") (re.range "0" "9")))) (str.to.re "\x0a")))))
; ^(\+)?([9]{1}[2]{1})?-? ?(\()?([0]{1})?[1-9]{2,4}(\))?-? ??(\()?[1-9]{4,7}(\))?$
(assert (not (str.in.re X (re.++ (re.opt (str.to.re "+")) (re.opt (re.++ ((_ re.loop 1 1) (str.to.re "9")) ((_ re.loop 1 1) (str.to.re "2")))) (re.opt (str.to.re "-")) (re.opt (str.to.re " ")) (re.opt (str.to.re "(")) (re.opt ((_ re.loop 1 1) (str.to.re "0"))) ((_ re.loop 2 4) (re.range "1" "9")) (re.opt (str.to.re ")")) (re.opt (str.to.re "-")) (re.opt (str.to.re " ")) (re.opt (str.to.re "(")) ((_ re.loop 4 7) (re.range "1" "9")) (re.opt (str.to.re ")")) (str.to.re "\x0a")))))
; ^[1-9]{1}[0-9]{3} ?[A-Z]{2}$
(assert (not (str.in.re X (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to.re " ")) ((_ re.loop 2 2) (re.range "A" "Z")) (str.to.re "\x0a")))))
; /filename=[^\n]*\x2exfdl/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".xfdl/i\x0a"))))
(check-sat)
