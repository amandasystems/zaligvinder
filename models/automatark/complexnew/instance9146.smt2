(declare-const X String)
; ^(\d?)*(\.\d{1}|\.\d{2})?$
(assert (str.in.re X (re.++ (re.* (re.opt (re.range "0" "9"))) (re.opt (re.++ (str.to.re ".") (re.union ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9"))))) (str.to.re "\x0a"))))
; [0-9][0-9][0-9][0-9]-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])\s{1}(0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])
(assert (not (str.in.re X (re.++ (re.range "0" "9") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9") (str.to.re "-") (re.union (re.++ (str.to.re "0") (re.range "1" "9")) (re.++ (str.to.re "1") (re.range "0" "2"))) (str.to.re "-") (re.union (re.++ (str.to.re "0") (re.range "1" "9")) (re.++ (str.to.re "1") (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "9")) (re.++ (str.to.re "3") (re.range "0" "1"))) ((_ re.loop 1 1) (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.union (re.++ (str.to.re "0") (re.range "0" "9")) (re.++ (str.to.re "1") (re.range "0" "9")) (re.++ (str.to.re "2") (re.range "0" "3"))) (str.to.re ":\x0a") (re.range "0" "5") (re.range "0" "9")))))
; (:[a-z]{1}[a-z1-9\$#_]*){1,31}
(assert (str.in.re X (re.++ ((_ re.loop 1 31) (re.++ (str.to.re ":") ((_ re.loop 1 1) (re.range "a" "z")) (re.* (re.union (re.range "a" "z") (re.range "1" "9") (str.to.re "$") (str.to.re "#") (str.to.re "_"))))) (str.to.re "\x0a"))))
; User-Agent\x3A.*User-Agent\x3A.*spyblini\x2Einidata\.warezclient\.com
(assert (str.in.re X (re.++ (str.to.re "User-Agent:") (re.* re.allchar) (str.to.re "User-Agent:") (re.* re.allchar) (str.to.re "spyblini.inidata.warezclient.com\x0a"))))
(check-sat)
