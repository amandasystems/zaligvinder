(declare-const X String)
; versionIDENTIFYstarted\x2EUser-Agent\x3A
(assert (not (str.in.re X (str.to.re "versionIDENTIFYstarted.User-Agent:\x0a"))))
(check-sat)
