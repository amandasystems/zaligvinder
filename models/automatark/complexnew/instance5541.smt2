(declare-const X String)
; couponbar\.coupons\.com\dOwner\x3A\s+Host\x3A
(assert (not (str.in.re X (re.++ (str.to.re "couponbar.coupons.com") (re.range "0" "9") (str.to.re "Owner:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Host:\x0a")))))
; Validation of Mexican RFC for tax payers (individuals)
(assert (str.in.re X (str.to.re "Validation of Mexican RFC for tax payers individuals\x0a")))
(check-sat)
