(declare-const X String)
; ookflolfctm\x2fnmot\.fmu
(assert (not (str.in.re X (str.to.re "ookflolfctm/nmot.fmu\x0a"))))
; ^([0]\d|[1][0-2]\/([0-2]\d|[3][0-1])\/([2][0]\d{2})\s([0-1]\d|[2][0-3])\:[0-5]\d\:[0-5]\d)?\s(AM|am|aM|Am|PM|pm|pM|Pm)
(assert (str.in.re X (re.++ (re.opt (re.union (re.++ (str.to.re "0") (re.range "0" "9")) (re.++ (str.to.re "1") (re.range "0" "2") (str.to.re "/") (re.union (re.++ (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to.re "3") (re.range "0" "1"))) (str.to.re "/") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "3"))) (str.to.re ":") (re.range "0" "5") (re.range "0" "9") (str.to.re ":") (re.range "0" "5") (re.range "0" "9") (str.to.re "20") ((_ re.loop 2 2) (re.range "0" "9"))))) (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (re.union (str.to.re "AM") (str.to.re "am") (str.to.re "aM") (str.to.re "Am") (str.to.re "PM") (str.to.re "pm") (str.to.re "pM") (str.to.re "Pm")) (str.to.re "\x0a"))))
; ^[a-zA-Z]([a-zA-Z0-9])*([\.][a-zA-Z]([a-zA-Z0-9])*)*$
(assert (not (str.in.re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (re.* (re.++ (str.to.re ".") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))))) (str.to.re "\x0a")))))
(check-sat)
