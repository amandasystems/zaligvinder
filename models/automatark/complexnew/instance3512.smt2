(declare-const X String)
; SpyBuddyZOMBIES\x5fHTTP\x5fGETearch\x2Eearthlink
(assert (not (str.in.re X (str.to.re "SpyBuddyZOMBIES_HTTP_GETearch.earthlink\x0a"))))
; /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
(assert (not (str.in.re X (re.++ (str.to.re "/") (re.opt (str.to.re "+")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to.re ")")) (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.union (str.to.re "-") (str.to.re ".") (str.to.re " "))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to.re "/;\x0a")))))
(check-sat)
