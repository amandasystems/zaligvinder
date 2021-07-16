(declare-const X String)
; /^\/[\w-]{48}\.[a-z]{2,8}[0-9]?$/U
(assert (not (str.in.re X (re.++ (str.to.re "//") ((_ re.loop 48 48) (re.union (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re ".") ((_ re.loop 2 8) (re.range "a" "z")) (re.opt (re.range "0" "9")) (str.to.re "/U\x0a")))))
; /MODE\sd?u?n?\x7b[AU]\x5c[LD]\x5c(86|64)\x5c\w{0,8}\x5c\w{2,16}\x7d[a-z]{8}\s\x2BpiwksT\x2Dx\x0D\x0A/i
(assert (not (str.in.re X (re.++ (str.to.re "/MODE") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (re.opt (str.to.re "d")) (re.opt (str.to.re "u")) (re.opt (str.to.re "n")) (str.to.re "{") (re.union (str.to.re "A") (str.to.re "U")) (str.to.re "\x5c") (re.union (str.to.re "L") (str.to.re "D")) (str.to.re "\x5c") (re.union (str.to.re "86") (str.to.re "64")) (str.to.re "\x5c") ((_ re.loop 0 8) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x5c") ((_ re.loop 2 16) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "}") ((_ re.loop 8 8) (re.range "a" "z")) (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "+piwksT-x\x0d\x0a/i\x0a")))))
; www\x2Efreescratchandwin\x2Ecom\w+Port.*User-Agent\x3AToolbarkit
(assert (str.in.re X (re.++ (str.to.re "www.freescratchandwin.com") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "Port") (re.* re.allchar) (str.to.re "User-Agent:Toolbarkit\x0a"))))
; /[^ -~\r\n]{4}/P
(assert (str.in.re X (re.++ (str.to.re "/") ((_ re.loop 4 4) (re.union (re.range " " "~") (str.to.re "\x0d") (str.to.re "\x0a"))) (str.to.re "/P\x0a"))))
(check-sat)
