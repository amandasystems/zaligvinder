(declare-const X String)
; /\x2escr([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.scr") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
; ^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}$
(assert (str.in.re X (re.++ (re.union (re.++ (str.to.re "+44") (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "7") ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ (re.opt (str.to.re "(")) (str.to.re "07") ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to.re ")")))) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "\x0a"))))
; /\x2Epor([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.por") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
(check-sat)
