(declare-const X String)
; onBetaHost\x3ayouRootReferer\x3A
(assert (str.in.re X (str.to.re "onBetaHost:youRootReferer:\x0a")))
(check-sat)
