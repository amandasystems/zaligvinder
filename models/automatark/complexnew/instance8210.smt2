(declare-const X String)
; /\/3001[0-9A-F]{262,304}/
(assert (str.in.re X (re.++ (str.to.re "//3001") ((_ re.loop 262 304) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to.re "/\x0a"))))
; /filename=[^\n]*\x2ekvl/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".kvl/i\x0a")))))
; zmnjgmomgbdz\x2fzzmw\.gzt\d+Ready
(assert (str.in.re X (re.++ (str.to.re "zmnjgmomgbdz/zzmw.gzt") (re.+ (re.range "0" "9")) (str.to.re "Ready\x0a"))))
; (\s(\bon[a-zA-Z][a-z]+)\s?\=\s?[\'\"]?(javascript\:)?[\w\(\),\' ]*;?[\'\"]?)+
(assert (str.in.re X (re.++ (re.+ (re.++ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "=") (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.opt (re.union (str.to.re "'") (str.to.re "\x22"))) (re.opt (str.to.re "javascript:")) (re.* (re.union (str.to.re "(") (str.to.re ")") (str.to.re ",") (str.to.re "'") (str.to.re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.opt (str.to.re ";")) (re.opt (re.union (str.to.re "'") (str.to.re "\x22"))) (str.to.re "on") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.+ (re.range "a" "z")))) (str.to.re "\x0a"))))
(check-sat)
