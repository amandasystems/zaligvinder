(declare-const X String)
; phpinfo[^\n\r]*195\.225\.\dccecaedbebfcaf\x2Ecom
(assert (str.in.re X (re.++ (str.to.re "phpinfo") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "195.225.") (re.range "0" "9") (str.to.re "ccecaedbebfcaf.com\x0a"))))
(check-sat)
