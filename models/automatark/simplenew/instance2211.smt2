(declare-const X String)
; Host\x3A\s+Host\x3ASubject\x3anamedDownloadUser-Agent\x3aBackAtTaCk
(assert (not (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Host:Subject:namedDownloadUser-Agent:BackAtTaCk\x0a")))))
(check-sat)
