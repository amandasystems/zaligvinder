(declare-const X String)
; InformationAgentReferer\x3AClient
(assert (str.in.re X (str.to.re "InformationAgentReferer:Client\x0a")))
(check-sat)
