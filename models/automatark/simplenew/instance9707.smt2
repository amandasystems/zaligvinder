(declare-const X String)
; /\/DES\d{9}O\d{4,5}\x2ejsp/Ui
(assert (str.in.re X (re.++ (str.to.re "//DES") ((_ re.loop 9 9) (re.range "0" "9")) (str.to.re "O") ((_ re.loop 4 5) (re.range "0" "9")) (str.to.re ".jsp/Ui\x0a"))))
(check-sat)
