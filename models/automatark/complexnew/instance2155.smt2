(declare-const X String)
; /filename=[^\n]*\x2easx/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".asx/i\x0a")))))
; IP\s+\.hta.*Theef2trustyfiles\x2Ecomlogs
(assert (not (str.in.re X (re.++ (str.to.re "IP") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re ".hta") (re.* re.allchar) (str.to.re "Theef2trustyfiles.comlogs\x0a")))))
(check-sat)
