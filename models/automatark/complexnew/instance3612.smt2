(declare-const X String)
; www\x2Esearchreslt\x2Ecom
(assert (str.in.re X (str.to.re "www.searchreslt.com\x0a")))
; ^(\+48\s+)?\d{3}(\s*|\-)\d{3}(\s*|\-)\d{3}$
(assert (str.in.re X (re.++ (re.opt (re.++ (str.to.re "+48") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))))) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "\x0a"))))
; Server\x3AWordTheHost\x3afrom
(assert (not (str.in.re X (str.to.re "Server:WordTheHost:from\x0a"))))
(check-sat)
