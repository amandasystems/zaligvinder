(declare-const X String)
; /\x2eimg([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.img") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
; ^([0-9]{8})|(R[0-9]{7})|((AC|FC|GE|GN|GS|IC|IP|LP|NA|NF|NI|NL|NO|NP|NR|NZ|OC|RC|SA|SC|SF|SI|SL|SO|SP|SR)[0-9]{6})$
(assert (not (str.in.re X (re.union ((_ re.loop 8 8) (re.range "0" "9")) (re.++ (str.to.re "R") ((_ re.loop 7 7) (re.range "0" "9"))) (re.++ (str.to.re "\x0a") (re.union (str.to.re "AC") (str.to.re "FC") (str.to.re "GE") (str.to.re "GN") (str.to.re "GS") (str.to.re "IC") (str.to.re "IP") (str.to.re "LP") (str.to.re "NA") (str.to.re "NF") (str.to.re "NI") (str.to.re "NL") (str.to.re "NO") (str.to.re "NP") (str.to.re "NR") (str.to.re "NZ") (str.to.re "OC") (str.to.re "RC") (str.to.re "SA") (str.to.re "SC") (str.to.re "SF") (str.to.re "SI") (str.to.re "SL") (str.to.re "SO") (str.to.re "SP") (str.to.re "SR")) ((_ re.loop 6 6) (re.range "0" "9")))))))
; Host\x3A\d+Litequick\x2Eqsrch\x2EcomaboutHost\x3AComputer\x7D\x7BSysuptime\x3A
(assert (not (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.range "0" "9")) (str.to.re "Litequick.qsrch.comaboutHost:Computer}{Sysuptime:\x0a")))))
(check-sat)
