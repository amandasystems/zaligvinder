(declare-const X String)
; Host\x3ATest\x3C\x2Fchat\x3EResultsSubject\x3A
(assert (not (str.in.re X (str.to.re "Host:Test</chat>ResultsSubject:\x0a"))))
; ^(([01][0-9]|[012][0-3]):([0-5][0-9]))*$
(assert (str.in.re X (re.++ (re.* (re.++ (re.union (re.++ (re.union (str.to.re "0") (str.to.re "1")) (re.range "0" "9")) (re.++ (re.union (str.to.re "0") (str.to.re "1") (str.to.re "2")) (re.range "0" "3"))) (str.to.re ":") (re.range "0" "5") (re.range "0" "9"))) (str.to.re "\x0a"))))
(check-sat)
