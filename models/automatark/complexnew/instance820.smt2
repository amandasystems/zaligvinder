(declare-const X String)
; forum=related\x2Eyok\x2Ecom\sStarted\!$3
(assert (not (str.in.re X (re.++ (str.to.re "forum=related.yok.com") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "Started!3\x0a")))))
; X-Mailer\x3a\s+cyber@yahoo\x2EcomcuAgent
(assert (not (str.in.re X (re.++ (str.to.re "X-Mailer:\x13") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "cyber@yahoo.comcuAgent\x0a")))))
; User-Agent\x3A\s+GET.*toowww\.123mania\.com
(assert (str.in.re X (re.++ (str.to.re "User-Agent:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "GET") (re.* re.allchar) (str.to.re "toowww.123mania.com\x0a"))))
(check-sat)
