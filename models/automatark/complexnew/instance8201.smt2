(declare-const X String)
; ^([0-7]{3})$
(assert (not (str.in.re X (re.++ ((_ re.loop 3 3) (re.range "0" "7")) (str.to.re "\x0a")))))
; ((0[13-7]|1[1235789]|[257][0-9]|3[0-35-9]|4[0124-9]|6[013-79]|8[0124-9]|9[0-5789])[0-9]{3}|10([2-9][0-9]{2}|1([2-9][0-9]|11[5-9]))|14([01][0-9]{2}|715))
(assert (not (str.in.re X (re.++ (re.union (re.++ (re.union (re.++ (str.to.re "0") (re.union (str.to.re "1") (re.range "3" "7"))) (re.++ (str.to.re "1") (re.union (str.to.re "1") (str.to.re "2") (str.to.re "3") (str.to.re "5") (str.to.re "7") (str.to.re "8") (str.to.re "9"))) (re.++ (re.union (str.to.re "2") (str.to.re "5") (str.to.re "7")) (re.range "0" "9")) (re.++ (str.to.re "3") (re.union (re.range "0" "3") (re.range "5" "9"))) (re.++ (str.to.re "4") (re.union (str.to.re "0") (str.to.re "1") (str.to.re "2") (re.range "4" "9"))) (re.++ (str.to.re "6") (re.union (str.to.re "0") (str.to.re "1") (re.range "3" "7") (str.to.re "9"))) (re.++ (str.to.re "8") (re.union (str.to.re "0") (str.to.re "1") (str.to.re "2") (re.range "4" "9"))) (re.++ (str.to.re "9") (re.union (re.range "0" "5") (str.to.re "7") (str.to.re "8") (str.to.re "9")))) ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ (str.to.re "10") (re.union (re.++ (re.range "2" "9") ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ (str.to.re "1") (re.union (re.++ (re.range "2" "9") (re.range "0" "9")) (re.++ (str.to.re "11") (re.range "5" "9")))))) (re.++ (str.to.re "14") (re.union (re.++ (re.union (str.to.re "0") (str.to.re "1")) ((_ re.loop 2 2) (re.range "0" "9"))) (str.to.re "715")))) (str.to.re "\x0a")))))
; /filename=[a-z]{5,8}\d{2,3}\.xap\x0d\x0a/Hm
(assert (str.in.re X (re.++ (str.to.re "/filename=") ((_ re.loop 5 8) (re.range "a" "z")) ((_ re.loop 2 3) (re.range "0" "9")) (str.to.re ".xap\x0d\x0a/Hm\x0a"))))
; ^\d{1,2}\/\d{2,4}$
(assert (str.in.re X (re.++ ((_ re.loop 1 2) (re.range "0" "9")) (str.to.re "/") ((_ re.loop 2 4) (re.range "0" "9")) (str.to.re "\x0a"))))
(check-sat)
