(declare-const X String)
; /filename=[^\n]*\x2ermp/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".rmp/i\x0a"))))
; /filename=[^\n]*\x2exbm/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".xbm/i\x0a")))))
(check-sat)
