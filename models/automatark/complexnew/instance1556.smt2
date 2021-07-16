(declare-const X String)
; /filename=[^\n]*\x2evsd/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".vsd/i\x0a"))))
; /filename=[^\n]*\x2easx/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".asx/i\x0a")))))
; Minutes\s+\x2Fcgi\x2Flogurl\.cgi\s+e2give\.com
(assert (not (str.in.re X (re.++ (str.to.re "Minutes") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "/cgi/logurl.cgi") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "e2give.com\x0a")))))
; ^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)?[0-9]{2}? ?((([0-1]?\d)|(2[0-3])):[0-5]\d)?(:[0-5]\d)? ?([a,p,A,P][m,M])?$
(assert (str.in.re X (re.++ (re.union (re.++ (re.opt (str.to.re "0")) (re.range "1" "9")) (re.++ (re.union (str.to.re "1") (str.to.re "2")) (re.range "0" "9")) (re.++ (str.to.re "3") (re.union (str.to.re "0") (str.to.re "1")))) (re.union (str.to.re "-") (str.to.re " ") (str.to.re "/") (str.to.re ".")) (re.union (re.++ (re.opt (str.to.re "0")) (re.range "1" "9")) (re.++ (str.to.re "1") (re.union (str.to.re "0") (str.to.re "1") (str.to.re "2")))) (re.union (str.to.re "-") (str.to.re " ") (str.to.re "/") (str.to.re ".")) (re.opt (re.union (str.to.re "19") (str.to.re "20"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to.re " ")) (re.opt (re.++ (re.union (re.++ (re.opt (re.range "0" "1")) (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "3"))) (str.to.re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt (re.++ (str.to.re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt (str.to.re " ")) (re.opt (re.++ (re.union (str.to.re "a") (str.to.re ",") (str.to.re "p") (str.to.re "A") (str.to.re "P")) (re.union (str.to.re "m") (str.to.re ",") (str.to.re "M")))) (str.to.re "\x0a"))))
(check-sat)
