(declare-const X String)
; \swww\.fast-finder\.com[^\n\r]*\x2Fbar_pl\x2Fchk\.fcgi\d+Toolbar
(assert (str.in.re X (re.++ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "www.fast-finder.com") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "/bar_pl/chk.fcgi") (re.+ (re.range "0" "9")) (str.to.re "Toolbar\x0a"))))
; from\x3AUser-Agent\x3AChildWebGuardian
(assert (not (str.in.re X (str.to.re "from:User-Agent:ChildWebGuardian\x0a"))))
; http://[^/]*/
(assert (not (str.in.re X (re.++ (str.to.re "http://") (re.* (re.comp (str.to.re "/"))) (str.to.re "/\x0a")))))
; DATencentTravelerWebConnLibHost\x3A
(assert (not (str.in.re X (str.to.re "DATencentTravelerWebConnLibHost:\x0a"))))
(check-sat)
