(declare-const X String)
; \d{3}-\d{6}
(assert (not (str.in.re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "-") ((_ re.loop 6 6) (re.range "0" "9")) (str.to.re "\x0a")))))
; /\x2exsl([\?\x5c\x2f]|$)/smiU
(assert (not (str.in.re X (re.++ (str.to.re "/.xsl") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a")))))
; ^((\+44\s?\d{4}|\(?\d{5}\)?)\s?\d{6})|((\+44\s?|0)7\d{3}\s?\d{6})$
(assert (str.in.re X (re.union (re.++ (re.union (re.++ (str.to.re "+44") (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (re.opt (str.to.re "(")) ((_ re.loop 5 5) (re.range "0" "9")) (re.opt (str.to.re ")")))) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 6 6) (re.range "0" "9"))) (re.++ (str.to.re "\x0a") (re.union (re.++ (str.to.re "+44") (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")))) (str.to.re "0")) (str.to.re "7") ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 6 6) (re.range "0" "9"))))))
; /filename=[^\n]*\x2ewal/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".wal/i\x0a")))))
(check-sat)
