(declare-const X String)
; /filename=[^\n]*\x2eskm/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".skm/i\x0a")))))
; \x22StarLogger\x22User-Agent\x3AJMailUser-Agent\x3A
(assert (not (str.in.re X (str.to.re "\x22StarLogger\x22User-Agent:JMailUser-Agent:\x0a"))))
(check-sat)
