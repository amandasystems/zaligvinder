(declare-const X String)
; User-Agent\x3AServerHost\x3A
(assert (not (str.in.re X (str.to.re "User-Agent:ServerHost:\x0a"))))
(check-sat)
