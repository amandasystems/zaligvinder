(declare-const X String)
; (^1300\d{6}$)|(^1800|1900|1902\d{6}$)|(^0[2|3|7|8]{1}[0-9]{8}$)|(^13\d{4}$)|(^04\d{2,3}\d{6}$)
(assert (str.in.re X (re.union (re.++ (str.to.re "1300") ((_ re.loop 6 6) (re.range "0" "9"))) (re.++ (str.to.re "0") ((_ re.loop 1 1) (re.union (str.to.re "2") (str.to.re "|") (str.to.re "3") (str.to.re "7") (str.to.re "8"))) ((_ re.loop 8 8) (re.range "0" "9"))) (re.++ (str.to.re "13") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (str.to.re "\x0a04") ((_ re.loop 2 3) (re.range "0" "9")) ((_ re.loop 6 6) (re.range "0" "9"))) (str.to.re "1800") (str.to.re "1900") (re.++ (str.to.re "1902") ((_ re.loop 6 6) (re.range "0" "9"))))))
; ^[a-z][a-z0-9\.,\-_]{5,31}$
(assert (str.in.re X (re.++ (re.range "a" "z") ((_ re.loop 5 31) (re.union (re.range "a" "z") (re.range "0" "9") (str.to.re ".") (str.to.re ",") (str.to.re "-") (str.to.re "_"))) (str.to.re "\x0a"))))
; (^[0-9]{2,3}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}$)
(assert (not (str.in.re X (re.++ (str.to.re "\x0a") ((_ re.loop 2 3) (re.range "0" "9")) (str.to.re ".") ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re ".") ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "/") ((_ re.loop 4 4) (re.range "0" "9")) (str.to.re "-") ((_ re.loop 2 2) (re.range "0" "9"))))))
; User-Agent\x3A\s+source\=IncrediFind
(assert (str.in.re X (re.++ (str.to.re "User-Agent:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "source=IncrediFind\x0a"))))
(check-sat)
