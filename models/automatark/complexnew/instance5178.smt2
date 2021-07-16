(declare-const X String)
; /ps0=[A-F0-9]*&ps1=[A-F0-9]*&cs1=[A-F0-9]*&cs2=[A-F0-9]*&cs3=[A-F0-9]*/P
(assert (str.in.re X (re.++ (str.to.re "/ps0=") (re.* (re.union (re.range "A" "F") (re.range "0" "9"))) (str.to.re "&ps1=") (re.* (re.union (re.range "A" "F") (re.range "0" "9"))) (str.to.re "&cs1=") (re.* (re.union (re.range "A" "F") (re.range "0" "9"))) (str.to.re "&cs2=") (re.* (re.union (re.range "A" "F") (re.range "0" "9"))) (str.to.re "&cs3=") (re.* (re.union (re.range "A" "F") (re.range "0" "9"))) (str.to.re "/P\x0a"))))
; Host\x3A\s+lnzzlnbk\x2fpkrm\.fin
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "lnzzlnbk/pkrm.fin\x0a"))))
; ^(([0-1]?[0-9])|([2][0-3])):([0-5][0-9])$
(assert (not (str.in.re X (re.++ (re.union (re.++ (re.opt (re.range "0" "1")) (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "3"))) (str.to.re ":\x0a") (re.range "0" "5") (re.range "0" "9")))))
(check-sat)
