(declare-const X String)
; /filename=[^\n]*\x2epkp/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".pkp/i\x0a"))))
; Login\d+dll\x3FHOST\x3Acontains
(assert (str.in.re X (re.++ (str.to.re "Login") (re.+ (re.range "0" "9")) (str.to.re "dll?HOST:contains\x0a"))))
(check-sat)
