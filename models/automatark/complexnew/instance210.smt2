(declare-const X String)
; Host\x3a[^\n\r]*A-311\s+lnzzlnbk\x2fpkrm\.finSubject\x3aBasic
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "A-311") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "lnzzlnbk/pkrm.finSubject:Basic\x0a"))))
; /\.php\x3fw\x3d\d+\x26n\x3d\d+/U
(assert (not (str.in.re X (re.++ (str.to.re "/.php?w=") (re.+ (re.range "0" "9")) (str.to.re "&n=") (re.+ (re.range "0" "9")) (str.to.re "/U\x0a")))))
(check-sat)
