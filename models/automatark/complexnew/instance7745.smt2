(declare-const X String)
; \.exe\s+ZC-Bridge\s+TPSystemHost\x3AHost\x3a
(assert (str.in.re X (re.++ (str.to.re ".exe") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "ZC-Bridge") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "TPSystemHost:Host:\x0a"))))
; /filename=[^\n]*\x2eogx/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".ogx/i\x0a")))))
; ^\d?\d'(\d|1[01])"$
(assert (not (str.in.re X (re.++ (re.opt (re.range "0" "9")) (re.range "0" "9") (str.to.re "'") (re.union (re.range "0" "9") (re.++ (str.to.re "1") (re.union (str.to.re "0") (str.to.re "1")))) (str.to.re "\x22\x0a")))))
(check-sat)
