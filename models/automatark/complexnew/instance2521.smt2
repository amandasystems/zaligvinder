(declare-const X String)
; ^(\d{1,})$|^(\d{1,}\.)$|^(\d{0,}?\.\d{1,})$|^([+-]\d{1,}(\.)?)$|^([+-](\d{1,})?\.\d{1,})$
(assert (not (str.in.re X (re.union (re.+ (re.range "0" "9")) (re.++ (re.+ (re.range "0" "9")) (str.to.re ".")) (re.++ (re.* (re.range "0" "9")) (str.to.re ".") (re.+ (re.range "0" "9"))) (re.++ (re.union (str.to.re "+") (str.to.re "-")) (re.+ (re.range "0" "9")) (re.opt (str.to.re "."))) (re.++ (str.to.re "\x0a") (re.union (str.to.re "+") (str.to.re "-")) (re.opt (re.+ (re.range "0" "9"))) (str.to.re ".") (re.+ (re.range "0" "9")))))))
; source%3Dultrasearch136%26campaign%3DsnapuplogWinInet3Azopabora\x2Einfo
(assert (str.in.re X (str.to.re "source%3Dultrasearch136%26campaign%3DsnapuplogWinInet3Azopabora.info\x0a")))
; /\x2ejpf([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.jpf") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
(check-sat)
