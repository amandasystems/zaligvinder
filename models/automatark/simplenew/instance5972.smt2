(declare-const X String)
; /\x2etif(f)?([\?\x5c\x2f]|$)/smiU
(assert (not (str.in.re X (re.++ (str.to.re "/.tif") (re.opt (str.to.re "f")) (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a")))))
(check-sat)
