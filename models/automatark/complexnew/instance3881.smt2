(declare-const X String)
; /\x2ef4a([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.f4a") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
; ver.*Black\s+CD\x2Furl=Host\x3anotification
(assert (not (str.in.re X (re.++ (str.to.re "ver") (re.* re.allchar) (str.to.re "Black") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "CD/url=Host:notification\x13\x0a")))))
; Spy\s+\x0d\x0a.*YAHOOdestroyed\x21Host\x3a
(assert (str.in.re X (re.++ (str.to.re "Spy") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "\x0d\x0a") (re.* re.allchar) (str.to.re "YAHOOdestroyed!Host:\x0a"))))
(check-sat)
