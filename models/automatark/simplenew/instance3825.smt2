(declare-const X String)
; \stoolbar\.anwb\.nl.*Host\x3A
(assert (not (str.in.re X (re.++ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "toolbar.anwb.nl") (re.* re.allchar) (str.to.re "Host:\x0a")))))
(check-sat)
