(declare-const X String)
; PORT\x3D\s+User-Agent\x3A\s+ProAgentUI2Host\x3A00000www\x2Ezhongsou\x2Ecom
(assert (not (str.in.re X (re.++ (str.to.re "PORT=") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "User-Agent:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "ProAgentUI2Host:00000www.zhongsou.com\x0a")))))
(check-sat)
