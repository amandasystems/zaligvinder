(declare-const X String)
; Host\x3A\s+twfofrfzlugq\x2feve\.qd\s+\x2Ftoolbar\x2Fsupremetb
(assert (not (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "twfofrfzlugq/eve.qd") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "/toolbar/supremetb\x0a")))))
(check-sat)
