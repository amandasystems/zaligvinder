(declare-const X String)
; Contact\d+Host\x3A[^\n\r]*User-Agent\x3AHost\x3aMailHost\x3aMSNLOGOVN
(assert (not (str.in.re X (re.++ (str.to.re "Contact") (re.+ (re.range "0" "9")) (str.to.re "Host:") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "User-Agent:Host:MailHost:MSNLOGOVN\x0a")))))
(check-sat)
