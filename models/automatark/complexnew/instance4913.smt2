(declare-const X String)
; /filename=[^\n]*\x2emet/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".met/i\x0a")))))
; DigExtNetBus\x5BStatic
(assert (str.in.re X (str.to.re "DigExtNetBus[Static\x0a")))
(check-sat)
