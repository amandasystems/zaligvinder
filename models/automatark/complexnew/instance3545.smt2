(declare-const X String)
; /filename=[^\n]*\x2emny/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".mny/i\x0a"))))
; /filename=[^\n]*\x2eswf/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".swf/i\x0a"))))
(check-sat)
