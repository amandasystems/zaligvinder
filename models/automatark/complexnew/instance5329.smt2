(declare-const X String)
; com\dsearch\x2econduit\x2ecom\s+User-Agent\x3A
(assert (str.in.re X (re.++ (str.to.re "com") (re.range "0" "9") (str.to.re "search.conduit.com") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "User-Agent:\x0a"))))
; ((20)[0-9]{2})-((0[1-9])|(1[0-2]))-((3[0-1])|([0-2][1-9]|([1-2][0-9])))\s((2[0-3])|[0-1][0-9]):[0-5][0-9]
(assert (str.in.re X (re.++ (str.to.re "-") (re.union (re.++ (str.to.re "0") (re.range "1" "9")) (re.++ (str.to.re "1") (re.range "0" "2"))) (str.to.re "-") (re.union (re.++ (str.to.re "3") (re.range "0" "1")) (re.++ (re.range "0" "2") (re.range "1" "9")) (re.++ (re.range "1" "2") (re.range "0" "9"))) (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (re.union (re.++ (str.to.re "2") (re.range "0" "3")) (re.++ (re.range "0" "1") (re.range "0" "9"))) (str.to.re ":") (re.range "0" "5") (re.range "0" "9") (str.to.re "\x0a20") ((_ re.loop 2 2) (re.range "0" "9")))))
; /filename=[^\n]*\x2ehlp/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".hlp/i\x0a")))))
; (^\b\d+-\d+$\b)|(^\b\d+$\b)
(assert (str.in.re X (re.union (re.++ (re.+ (re.range "0" "9")) (str.to.re "-") (re.+ (re.range "0" "9"))) (re.++ (re.+ (re.range "0" "9")) (str.to.re "\x0a")))))
(check-sat)
