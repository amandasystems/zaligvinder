(declare-const X String)
; Logger.*aresflashdownloader\x2Ecom
(assert (str.in.re X (re.++ (str.to.re "Logger") (re.* re.allchar) (str.to.re "aresflashdownloader.com\x0a"))))
; ^((Fred|Wilma)\s+Flintstone|(Barney|Betty)\s+Rubble)$
(assert (str.in.re X (re.++ (re.union (re.++ (re.union (str.to.re "Fred") (str.to.re "Wilma")) (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Flintstone")) (re.++ (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "RubbleB") (re.union (str.to.re "arney") (str.to.re "etty")))) (str.to.re "\x0a"))))
(check-sat)
