(declare-const X String)
; Host\x3A.*www\x2e2-seek\x2ecom\x2fsearch
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.* re.allchar) (str.to.re "www.2-seek.com/search\x0a"))))
; [A-Za-z]{1,2}[\d]{1,2}[A-Za-z]{0,1}\s*[\d]
(assert (str.in.re X (re.++ ((_ re.loop 1 2) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 1 2) (re.range "0" "9")) (re.opt (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.range "0" "9") (str.to.re "\x0a"))))
(check-sat)
