(declare-const X String)
; /\x2ewebm([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.webm") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
(check-sat)
