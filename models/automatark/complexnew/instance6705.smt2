(declare-const X String)
; [1-2][0|9][0-9]{2}[0-1][0-9][0-3][0-9][-][0-9]{4}
(assert (not (str.in.re X (re.++ (re.range "1" "2") (re.union (str.to.re "0") (str.to.re "|") (str.to.re "9")) ((_ re.loop 2 2) (re.range "0" "9")) (re.range "0" "1") (re.range "0" "9") (re.range "0" "3") (re.range "0" "9") (str.to.re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to.re "\x0a")))))
; /filename=[^\n]*\x2exml/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".xml/i\x0a"))))
; /filename=[^\n]*\x2ecov/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".cov/i\x0a"))))
(check-sat)
