(declare-const X String)
; /filename=[^\n]*\x2ehhk/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".hhk/i\x0a")))))
; (\s(\bon[a-zA-Z][a-z]+)\s?\=\s?[\'\"]?(javascript\:)?[\w\(\),\' ]*;?[\'\"]?)+
(assert (not (str.in.re X (re.++ (re.+ (re.++ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "=") (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.opt (re.union (str.to.re "'") (str.to.re "\x22"))) (re.opt (str.to.re "javascript:")) (re.* (re.union (str.to.re "(") (str.to.re ")") (str.to.re ",") (str.to.re "'") (str.to.re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.opt (str.to.re ";")) (re.opt (re.union (str.to.re "'") (str.to.re "\x22"))) (str.to.re "on") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.+ (re.range "a" "z")))) (str.to.re "\x0a")))))
; /^ver\x3aGhost\s+version\s+\d+\x2E\d+\s+server/smi
(assert (str.in.re X (re.++ (str.to.re "/ver:Ghost") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "version") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.+ (re.range "0" "9")) (str.to.re ".") (re.+ (re.range "0" "9")) (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "server/smi\x0a"))))
; \x2Fbar_pl\x2Fchk\.fcgiHost\x3a
(assert (not (str.in.re X (str.to.re "/bar_pl/chk.fcgiHost:\x0a"))))
(check-sat)
