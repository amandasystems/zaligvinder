(declare-const X String)
; ^[+][0-9]\d{2}-\d{3}-\d{4}$
(assert (str.in.re X (re.++ (str.to.re "+") (re.range "0" "9") ((_ re.loop 2 2) (re.range "0" "9")) (str.to.re "-") ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to.re "\x0a"))))
; /^(www\.|http:\/\/|https:\/\/|http:\/\/www\.|https:\/\/www\.)[a-z0-9]+\.[a-z]{2,4}$/
(assert (not (str.in.re X (re.++ (str.to.re "/") (re.union (str.to.re "www.") (str.to.re "http://") (str.to.re "https://") (str.to.re "http://www.") (str.to.re "https://www.")) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to.re ".") ((_ re.loop 2 4) (re.range "a" "z")) (str.to.re "/\x0a")))))
(check-sat)
