(declare-const X String)
; User-Agent\x3AUser-Agent\x3a
(assert (not (str.in.re X (str.to.re "User-Agent:User-Agent:\x0a"))))
; ShadowNetMyAgentServerconfigINTERNAL\.iniKeylogger-Prosearchreslt
(assert (str.in.re X (str.to.re "ShadowNetMyAgentServerconfigINTERNAL.iniKeylogger-Prosearchreslt\x0a")))
; /\x2ecnt([\?\x5c\x2f]|$)/smiU
(assert (not (str.in.re X (re.++ (str.to.re "/.cnt") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a")))))
(check-sat)
