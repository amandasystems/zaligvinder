(declare-const X String)
; X-Spam-Level:\s[*]{11}
(assert (not (str.in.re X (re.++ (str.to.re "X-Spam-Level:") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) ((_ re.loop 11 11) (str.to.re "*")) (str.to.re "\x0a")))))
; /(DisableSandboxAndDrop|ConfusedClass|FieldAccessVerifierExpl)\.class/ims
(assert (not (str.in.re X (re.++ (str.to.re "/") (re.union (str.to.re "DisableSandboxAndDrop") (str.to.re "ConfusedClass") (str.to.re "FieldAccessVerifierExpl")) (str.to.re ".class/ims\x0a")))))
; www\x2Ecameup\x2EcomNetTracker
(assert (str.in.re X (str.to.re "www.cameup.com\x13NetTracker\x0a")))
; ^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$
(assert (not (str.in.re X (re.++ (re.union (re.++ (re.union (re.range "A" "P") (re.range "R" "U") (str.to.re "W") (str.to.re "Y") (str.to.re "Z") (re.range "0" "9")) (re.union (re.range "A" "H") (re.range "K" "Y") (re.range "0" "9")) (re.opt (re.union (str.to.re "A") (str.to.re "E") (str.to.re "H") (str.to.re "M") (str.to.re "N") (str.to.re "P") (str.to.re "R") (str.to.re "T") (str.to.re "V") (str.to.re "X") (str.to.re "Y") (re.range "0" "9"))) (re.opt (re.union (str.to.re "A") (str.to.re "B") (str.to.re "E") (str.to.re "H") (str.to.re "M") (str.to.re "N") (str.to.re "P") (str.to.re "R") (str.to.re "V") (str.to.re "W") (str.to.re "X") (str.to.re "Y") (re.range "0" "9"))) ((_ re.loop 1 2) (str.to.re " ")) (re.range "0" "9") ((_ re.loop 2 2) (re.union (str.to.re "A") (str.to.re "B") (re.range "D" "H") (str.to.re "J") (str.to.re "L") (re.range "N" "U") (re.range "W" "Z")))) (str.to.re "GIR 0AA")) (str.to.re "\x0a")))))
(check-sat)
