(declare-const X String)
; badurl\x2Egrandstreetinteractive\x2EcomFilteredHost\x3Ae2give\.com\x2Fnewsurfer4\x2F
(assert (not (str.in.re X (str.to.re "badurl.grandstreetinteractive.comFilteredHost:e2give.com/newsurfer4/\x0a"))))
; (^(\+?\-? *[0-9]+)([,0-9 ]*)([0-9 ])*$)|(^ *$)
(assert (str.in.re X (re.union (re.++ (re.* (re.union (str.to.re ",") (re.range "0" "9") (str.to.re " "))) (re.* (re.union (re.range "0" "9") (str.to.re " "))) (re.opt (str.to.re "+")) (re.opt (str.to.re "-")) (re.* (str.to.re " ")) (re.+ (re.range "0" "9"))) (re.++ (re.* (str.to.re " ")) (str.to.re "\x0a")))))
; User-Agent\x3Aupgrade\x2Eqsrch\x2Einfo
(assert (not (str.in.re X (str.to.re "User-Agent:upgrade.qsrch.info\x0a"))))
; ^(http(s?)\:\/\/)*[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&%\$#_]*)?$
(assert (str.in.re X (re.++ (re.* (re.++ (str.to.re "http") (re.opt (str.to.re "s")) (str.to.re "://"))) (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z")) (re.* (re.++ (re.* (re.union (str.to.re "-") (str.to.re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z")))) (re.* (re.++ (str.to.re ":") (re.* (str.to.re "0-9")))) (re.opt (str.to.re "/")) (re.opt (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to.re "-") (str.to.re ".") (str.to.re "?") (str.to.re ",") (str.to.re "'") (str.to.re "/") (str.to.re "\x5c") (str.to.re "+") (str.to.re "&") (str.to.re "%") (str.to.re "$") (str.to.re "#") (str.to.re "_")))) (str.to.re "\x0a"))))
(check-sat)
