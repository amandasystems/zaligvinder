(declare-const X String)
; Authorization\x3a\s+Host\x3a
(assert (str.in.re X (re.++ (str.to.re "Authorization:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Host:\x0a"))))
; /filename=[^\n]*\x2ecsv/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".csv/i\x0a"))))
(check-sat)
