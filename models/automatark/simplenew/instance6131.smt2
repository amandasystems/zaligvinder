(declare-const X String)
; Toolbar\s+pjpoptwql\x2frlnjSubject\x3A
(assert (not (str.in.re X (re.++ (str.to.re "Toolbar") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "pjpoptwql/rlnjSubject:\x0a")))))
(check-sat)
