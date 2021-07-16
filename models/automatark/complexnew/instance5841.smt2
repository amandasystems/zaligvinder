(declare-const X String)
; ^\s*(?i:)((1[0-2])|(0[1-9])|([123456789])):(([0-5][0-9])|([123456789]))\s(am|pm)\s*$
(assert (str.in.re X (re.++ (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.union (re.++ (str.to.re "1") (re.range "0" "2")) (re.++ (str.to.re "0") (re.range "1" "9")) (str.to.re "1") (str.to.re "2") (str.to.re "3") (str.to.re "4") (str.to.re "5") (str.to.re "6") (str.to.re "7") (str.to.re "8") (str.to.re "9")) (str.to.re ":") (re.union (re.++ (re.range "0" "5") (re.range "0" "9")) (str.to.re "1") (str.to.re "2") (str.to.re "3") (str.to.re "4") (str.to.re "5") (str.to.re "6") (str.to.re "7") (str.to.re "8") (str.to.re "9")) (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (re.union (str.to.re "am") (str.to.re "pm")) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "\x0a"))))
; User-Agent\x3ABetaWordixqshv\x2fqzccsServer\x00
(assert (not (str.in.re X (str.to.re "User-Agent:BetaWordixqshv/qzccsServer\x00\x0a"))))
(check-sat)
