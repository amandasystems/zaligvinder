(declare-const X String)
; ^(([1-9]\d{0,2}(\,\d{3})*|([1-9]\d*))(\.\d{2})?)|([0]\.(([0][1-9])|([1-9]\d)))$
(assert (not (str.in.re X (re.union (re.++ (re.union (re.++ (re.range "1" "9") ((_ re.loop 0 2) (re.range "0" "9")) (re.* (re.++ (str.to.re ",") ((_ re.loop 3 3) (re.range "0" "9"))))) (re.++ (re.range "1" "9") (re.* (re.range "0" "9")))) (re.opt (re.++ (str.to.re ".") ((_ re.loop 2 2) (re.range "0" "9"))))) (re.++ (str.to.re "\x0a0.") (re.union (re.++ (str.to.re "0") (re.range "1" "9")) (re.++ (re.range "1" "9") (re.range "0" "9"))))))))
; Ready[^\n\r]*User-Agent\x3A\s+Client\dFrom\x3AWebtool\x2Eworld2\x2EcnUser-Agent\x3AUser-Agent\x3a
(assert (not (str.in.re X (re.++ (str.to.re "Ready") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "User-Agent:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Client") (re.range "0" "9") (str.to.re "From:Webtool.world2.cn\x13User-Agent:User-Agent:\x0a")))))
; /filename=[^\n]*\x2esum/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".sum/i\x0a"))))
; [+-]*[0-9]+[,]*[0-9]*|[+-]*[0-9]*[,]+[0-9]*
(assert (not (str.in.re X (re.union (re.++ (re.* (re.union (str.to.re "+") (str.to.re "-"))) (re.+ (re.range "0" "9")) (re.* (str.to.re ",")) (re.* (re.range "0" "9"))) (re.++ (re.* (re.union (str.to.re "+") (str.to.re "-"))) (re.* (re.range "0" "9")) (re.+ (str.to.re ",")) (re.* (re.range "0" "9")) (str.to.re "\x0a"))))))
; ^[0]*?[1-9]\d*\.?[0]*$
(assert (not (str.in.re X (re.++ (re.* (str.to.re "0")) (re.range "1" "9") (re.* (re.range "0" "9")) (re.opt (str.to.re ".")) (re.* (str.to.re "0")) (str.to.re "\x0a")))))
(check-sat)
