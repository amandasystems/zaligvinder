(declare-const X String)
; onAlertMGS-Internal-Web-Manager
(assert (str.in.re X (str.to.re "onAlertMGS-Internal-Web-Manager\x0a")))
; ^(s-|S-){0,1}[0-9]{3}\s?[0-9]{2}$
(assert (not (str.in.re X (re.++ (re.opt (re.union (str.to.re "s-") (str.to.re "S-"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 2 2) (re.range "0" "9")) (str.to.re "\x0a")))))
; ^((([sS][r-tR-Tx-zX-Z])\s*([sx-zSX-Z])?\s*([a-zA-Z]{2,3}))?\s*(\d\d)\s*-?\s*(\d{6,7}))$
(assert (str.in.re X (re.++ (str.to.re "\x0a") (re.opt (re.++ (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.opt (re.union (str.to.re "s") (re.range "x" "z") (str.to.re "S") (re.range "X" "Z"))) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 2 3) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.union (str.to.re "s") (str.to.re "S")) (re.union (re.range "r" "t") (re.range "R" "T") (re.range "x" "z") (re.range "X" "Z")))) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.opt (str.to.re "-")) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 6 7) (re.range "0" "9")) (re.range "0" "9") (re.range "0" "9"))))
; Windows\x2Fclient\x2FBlackreportc\.goclick\.comX-Sender\x3A
(assert (str.in.re X (str.to.re "Windows/client/Blackreportc.goclick.comX-Sender:\x13\x0a")))
(check-sat)
