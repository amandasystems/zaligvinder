(declare-const X String)
; ^[\w\s]+$
(assert (str.in.re X (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "\x0a"))))
; ^[ a - z, 0 - 9 , ?   -   ?   ,?   -   ? , ?    -  ?   ,?   -  ? , . ]
(assert (not (str.in.re X (re.++ (re.union (str.to.re " ") (str.to.re "a") (re.range " " " ") (str.to.re "z") (str.to.re ",") (str.to.re "0") (str.to.re "9") (str.to.re "?") (str.to.re ".")) (str.to.re "\x0a")))))
; httphost\dActivityfilename=\x22
(assert (not (str.in.re X (re.++ (str.to.re "httphost") (re.range "0" "9") (str.to.re "Activityfilename=\x22\x0a")))))
(check-sat)
