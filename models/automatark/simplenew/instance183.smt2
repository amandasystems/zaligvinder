(declare-const X String)
; Googlelog\=\x7BIP\x3APG=SPEEDBAR
(assert (not (str.in.re X (str.to.re "Googlelog={IP:PG=SPEEDBAR\x0a"))))
(check-sat)
