(declare-const X String)
; /filename=[^\n]*\x2eppsx/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".ppsx/i\x0a")))))
; ^\b(29[0-9]|2[0-9][0-9]|[01]?[0-9][0-9]?)\\/(29[0-9]|2[0-9][0-9]|[01]?[0-9][0-9]?)$
(assert (str.in.re X (re.++ (re.union (re.++ (str.to.re "29") (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "9") (re.range "0" "9")) (re.++ (re.opt (re.union (str.to.re "0") (str.to.re "1"))) (re.range "0" "9") (re.opt (re.range "0" "9")))) (str.to.re "\x5c/") (re.union (re.++ (str.to.re "29") (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "9") (re.range "0" "9")) (re.++ (re.opt (re.union (str.to.re "0") (str.to.re "1"))) (re.range "0" "9") (re.opt (re.range "0" "9")))) (str.to.re "\x0a"))))
; \stoolbar\.anwb\.nl\s+A-311.*Host\x3aHost\x3Ayddznydqir\x2fevi
(assert (str.in.re X (re.++ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "toolbar.anwb.nl") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "A-311") (re.* re.allchar) (str.to.re "Host:Host:yddznydqir/evi\x0a"))))
(check-sat)
