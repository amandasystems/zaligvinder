(declare-const X String)
; SbAts[^\n\r]*Subject\x3a\d+dcww\x2Edmcast\x2Ecom
(assert (str.in.re X (re.++ (str.to.re "SbAts") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "Subject:") (re.+ (re.range "0" "9")) (str.to.re "dcww.dmcast.com\x0a"))))
; /filename=[^\n]*\x2ezip/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".zip/i\x0a")))))
(check-sat)
