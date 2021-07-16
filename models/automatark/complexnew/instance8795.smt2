(declare-const X String)
; ^([a-zA-z]:((\\([-*\.*\w+\s+\d+]+)|(\w+)\\)+)(\w+.zip)|(\w+.ZIP))$
(assert (str.in.re X (re.++ (re.union (re.++ (re.union (re.range "a" "z") (re.range "A" "z")) (str.to.re ":") (re.+ (re.union (re.++ (str.to.re "\x5c") (re.+ (re.union (str.to.re "-") (str.to.re "*") (str.to.re ".") (str.to.re "+") (re.range "0" "9") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")))) (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x5c")))) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) re.allchar (str.to.re "zip")) (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) re.allchar (str.to.re "ZIP"))) (str.to.re "\x0a"))))
; User-Agent\x3a\w+Owner\x3A
(assert (str.in.re X (re.++ (str.to.re "User-Agent:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "Owner:\x0a"))))
; Host\x3A[^\n\r]*cache\x2Eeverer\x2Ecom\s+from\.myway\.comToolbar
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "cache.everer.com") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "from.myway.com\x1bToolbar\x0a"))))
(check-sat)
