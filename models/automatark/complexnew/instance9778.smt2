(declare-const X String)
; /\.php\x3fw\x3d\d+\x26n\x3d\d+/U
(assert (not (str.in.re X (re.++ (str.to.re "/.php?w=") (re.+ (re.range "0" "9")) (str.to.re "&n=") (re.+ (re.range "0" "9")) (str.to.re "/U\x0a")))))
; \x2Fsearchfast\x2F\s+Host\x3A\s+
(assert (str.in.re X (re.++ (str.to.re "/searchfast/") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Host:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "\x0a"))))
; User-Agent\x3ABetaWordixqshv\x2fqzccsServer\x00
(assert (str.in.re X (str.to.re "User-Agent:BetaWordixqshv/qzccsServer\x00\x0a")))
; ^((0?[1-9]|1[012])(:[0-5]\d){1,2}(\ [AaPp][Mm]))$
(assert (str.in.re X (re.++ (str.to.re "\x0a") (re.union (re.++ (re.opt (str.to.re "0")) (re.range "1" "9")) (re.++ (str.to.re "1") (re.union (str.to.re "0") (str.to.re "1") (str.to.re "2")))) ((_ re.loop 1 2) (re.++ (str.to.re ":") (re.range "0" "5") (re.range "0" "9"))) (str.to.re " ") (re.union (str.to.re "A") (str.to.re "a") (str.to.re "P") (str.to.re "p")) (re.union (str.to.re "M") (str.to.re "m")))))
(check-sat)
