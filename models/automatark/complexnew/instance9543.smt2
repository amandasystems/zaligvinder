(declare-const X String)
; <(\/{0,1})img(.*?)(\/{0,1})\>
(assert (str.in.re X (re.++ (str.to.re "<") (re.opt (str.to.re "/")) (str.to.re "img") (re.* re.allchar) (re.opt (str.to.re "/")) (str.to.re ">\x0a"))))
; Host\x3A.*c=[^\n\r]*KeyloggerHost\x3Awww\.trackhits\.cc
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.* re.allchar) (str.to.re "c=") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "KeyloggerHost:www.trackhits.cc\x0a"))))
(check-sat)
