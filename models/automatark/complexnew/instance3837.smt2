(declare-const X String)
; Toolbar\d+Host\x3AWelcome\x2FcommunicatortbGateCrasher
(assert (str.in.re X (re.++ (str.to.re "Toolbar") (re.+ (re.range "0" "9")) (str.to.re "Host:Welcome/communicatortbGateCrasher\x0a"))))
; /null[^\x7d]{0,50}\.body\.innerHTML\s*?\x3d\s*?[\x22\x27]{2}[^\x7d]{0,50}CollectGarbage\x28\s*?\x29[^\x7d]{0,250}document\.write\x28\s*?[\x22\x27]{2}/smi
(assert (str.in.re X (re.++ (str.to.re "/null") ((_ re.loop 0 50) (re.comp (str.to.re "}"))) (str.to.re ".body.innerHTML") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "=") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 2 2) (re.union (str.to.re "\x22") (str.to.re "'"))) ((_ re.loop 0 50) (re.comp (str.to.re "}"))) (str.to.re "CollectGarbage(") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re ")") ((_ re.loop 0 250) (re.comp (str.to.re "}"))) (str.to.re "document.write(") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 2 2) (re.union (str.to.re "\x22") (str.to.re "'"))) (str.to.re "/smi\x0a"))))
; \x2FcommunicatortbHost\x3a
(assert (str.in.re X (str.to.re "/communicatortbHost:\x0a")))
; <img[^>]*src=\"?([^\"]*)\"?([^>]*alt=\"?([^\"]*)\"?)?[^>]*>
(assert (str.in.re X (re.++ (str.to.re "<img") (re.* (re.comp (str.to.re ">"))) (str.to.re "src=") (re.opt (str.to.re "\x22")) (re.* (re.comp (str.to.re "\x22"))) (re.opt (str.to.re "\x22")) (re.opt (re.++ (re.* (re.comp (str.to.re ">"))) (str.to.re "alt=") (re.opt (str.to.re "\x22")) (re.* (re.comp (str.to.re "\x22"))) (re.opt (str.to.re "\x22")))) (re.* (re.comp (str.to.re ">"))) (str.to.re ">\x0a"))))
; ^<\!\-\-(.*)+(\/){0,1}\-\->$
(assert (not (str.in.re X (re.++ (str.to.re "<!--") (re.+ (re.* re.allchar)) (re.opt (str.to.re "/")) (str.to.re "-->\x0a")))))
(check-sat)
