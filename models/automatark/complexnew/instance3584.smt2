(declare-const X String)
; IDENTIFY666User-Agent\x3A\x5BStaticSend=Host\x3Awww\.iggsey\.com
(assert (not (str.in.re X (str.to.re "IDENTIFY666User-Agent:[StaticSend=Host:www.iggsey.com\x0a"))))
; Host\x3AHost\x3ALOGServer\.compressxpsp2-toolbar\x2Ehotblox\x2EcomAttached100013Agentsvr\x5E\x5EMerlin
(assert (not (str.in.re X (str.to.re "Host:Host:LOGServer.compressxpsp2-toolbar.hotblox.comAttached100013Agentsvr^^Merlin\x13\x0a"))))
(check-sat)
