(declare-const X String)
; ^[-]?[0-9]*\.?[0-9]?[0-9]?[0-9]?[0-9]?
(assert (not (str.in.re X (re.++ (re.opt (str.to.re "-")) (re.* (re.range "0" "9")) (re.opt (str.to.re ".")) (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (str.to.re "\x0a")))))
; PASSW=\s+\x2Fta\x2FNEWS\x2F.*loomcompany\x2Ecom
(assert (not (str.in.re X (re.++ (str.to.re "PASSW=") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "/ta/NEWS/") (re.* re.allchar) (str.to.re "loomcompany.com\x0a")))))
(check-sat)
