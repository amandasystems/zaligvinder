(declare-const X String)
; /filename=[^\n]*\x2eabc/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".abc/i\x0a"))))
; /filename=[^\n]*\x2epct/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".pct/i\x0a"))))
(check-sat)
