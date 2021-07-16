(declare-const X String)
; ([a-zA-Z]{2}[0-9]{1,2}\s{0,1}[0-9]{1,2}[a-zA-Z]{2})
(assert (str.in.re X (re.++ (str.to.re "\x0a") ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 1 2) (re.range "0" "9")) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 1 2) (re.range "0" "9")) ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))))))
; /filename=[^\n]*\x2evwr/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".vwr/i\x0a"))))
; User-Agent\x3Awww\x2Emyarmory\x2EcomHost\x3AUser-Agent\x3aHost\x3AportAuthorization\x3a\x2Fnewsurfer4\x2F
(assert (str.in.re X (str.to.re "User-Agent:www.myarmory.comHost:User-Agent:Host:portAuthorization:/newsurfer4/\x0a")))
(check-sat)
