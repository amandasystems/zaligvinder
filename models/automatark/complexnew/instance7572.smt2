(declare-const X String)
; ^([0-9]{1})([0-9]{2})([0-9]{2})([0-9]{7})([0-9]{1})$
(assert (not (str.in.re X (re.++ ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 7 7) (re.range "0" "9")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to.re "\x0a")))))
; ookflolfctm\x2fnmot\.fmu
(assert (not (str.in.re X (str.to.re "ookflolfctm/nmot.fmu\x0a"))))
(check-sat)
