(declare-const X String)
; Bar\x2Fnewsurfer4\x2Fclient=BysooTBADdcww\x2Edmcast\x2Ecomc\.goclick\.com
(assert (not (str.in.re X (str.to.re "Bar/newsurfer4/client=BysooTBADdcww.dmcast.comc.goclick.com\x0a"))))
; ^(([a-zA-Z0-9]+([\-])?[a-zA-Z0-9]+)+(\.)?)+[a-zA-Z]{2,6}$
(assert (not (str.in.re X (re.++ (re.+ (re.++ (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (re.opt (str.to.re "-")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))))) (re.opt (str.to.re ".")))) ((_ re.loop 2 6) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to.re "\x0a")))))
; ^\w*[-]*\w*\\\w*$
(assert (str.in.re X (re.++ (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.* (str.to.re "-")) (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x5c") (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x0a"))))
(check-sat)
