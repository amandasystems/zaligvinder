(declare-const X String)
; /\x00{7}\x53\x00{3}\x16.{8}[^\x00]*?[\x22\x27\x29\x3b]/
(assert (not (str.in.re X (re.++ (str.to.re "/") ((_ re.loop 7 7) (str.to.re "\x00")) (str.to.re "S") ((_ re.loop 3 3) (str.to.re "\x00")) (str.to.re "\x16") ((_ re.loop 8 8) re.allchar) (re.* (re.comp (str.to.re "\x00"))) (re.union (str.to.re "\x22") (str.to.re "'") (str.to.re ")") (str.to.re ";")) (str.to.re "/\x0a")))))
; /\x2ert([\?\x5c\x2f]|$)/smiU
(assert (not (str.in.re X (re.++ (str.to.re "/.rt") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a")))))
(check-sat)
