(declare-const X String)
; PASSW=\s+\x2Fta\x2FNEWS\x2F.*loomcompany\x2Ecom
(assert (str.in.re X (re.++ (str.to.re "PASSW=") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "/ta/NEWS/") (re.* re.allchar) (str.to.re "loomcompany.com\x0a"))))
; ^([^:])+\\.([^:])+$
(assert (str.in.re X (re.++ (re.+ (re.comp (str.to.re ":"))) (str.to.re "\x5c") re.allchar (re.+ (re.comp (str.to.re ":"))) (str.to.re "\x0a"))))
(check-sat)
