(declare-const X String)
; www\x2Epurityscan\x2Ecom.*
(assert (not (str.in.re X (re.++ (str.to.re "www.purityscan.com") (re.* re.allchar) (str.to.re "\x0a")))))
; \b4[0-9]\b
(assert (not (str.in.re X (re.++ (str.to.re "4") (re.range "0" "9") (str.to.re "\x0a")))))
(check-sat)
