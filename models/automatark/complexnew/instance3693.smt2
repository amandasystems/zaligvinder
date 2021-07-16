(declare-const X String)
; Pattern that matches all DVLA Vehicle Registration Marks (VRM). Allows for an optional single space between segments.
(assert (str.in.re X (re.++ (str.to.re "Pattern that matches all DVLA Vehicle Registration Marks VRM") re.allchar (str.to.re " Allows for an optional single space between segments") re.allchar (str.to.re "\x0a"))))
; ^((\+989)|(989)|(00989)|(09|9))([1|2|3][0-9]\d{7}$)
(assert (not (str.in.re X (re.++ (re.union (str.to.re "+989") (str.to.re "989") (str.to.re "00989") (str.to.re "09") (str.to.re "9")) (str.to.re "\x0a") (re.union (str.to.re "1") (str.to.re "|") (str.to.re "2") (str.to.re "3")) (re.range "0" "9") ((_ re.loop 7 7) (re.range "0" "9"))))))
; Host\x3A\s+www\x2Ewebfringe\x2Ecom\d+Version\d\x2ElSpywww\x2Elookquick\x2EcomSubject\x3A\x3a\x29\r\n
(assert (not (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "www.webfringe.com") (re.+ (re.range "0" "9")) (str.to.re "Version") (re.range "0" "9") (str.to.re ".lSpywww.lookquick.comSubject::)\x0d\x0a\x13\x0a")))))
; /^slowhttp\x7c\d+\x7c\d+\x7C[a-z0-9]+\x2E[a-z]{2,3}\x7C[a-z0-9]+\x7C/
(assert (str.in.re X (re.++ (str.to.re "/slowhttp|") (re.+ (re.range "0" "9")) (str.to.re "|") (re.+ (re.range "0" "9")) (str.to.re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to.re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to.re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to.re "|/\x0a"))))
; /\x2Fmrow\x5Fpin\x2F\x3Fid\d+[a-z]{5,}\d{5}\x26rnd\x3D\d+/smi
(assert (not (str.in.re X (re.++ (str.to.re "//mrow_pin/?id") (re.+ (re.range "0" "9")) ((_ re.loop 5 5) (re.range "0" "9")) (str.to.re "&rnd=") (re.+ (re.range "0" "9")) (str.to.re "/smi\x0a") ((_ re.loop 5 5) (re.range "a" "z")) (re.* (re.range "a" "z"))))))
(check-sat)
