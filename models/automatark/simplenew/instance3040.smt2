(declare-const X String)
; /filename=[^\n]*\x2epor/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".por/i\x0a"))))
(check-sat)
