(declare-const X String)
; Host\x3A\sHello\x2E.*forum=
(assert (not (str.in.re X (re.++ (str.to.re "Host:") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "Hello.") (re.* re.allchar) (str.to.re "forum=\x0a")))))
(check-sat)
