(declare-const X String)
; //.*|/\*[\s\S]*?\*/
(assert (not (str.in.re X (re.++ (str.to.re "/") (re.union (re.++ (str.to.re "/") (re.* re.allchar)) (re.++ (str.to.re "*") (re.* (re.union (re.comp (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "*/\x0a")))))))
(check-sat)
