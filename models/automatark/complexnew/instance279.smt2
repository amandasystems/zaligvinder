(declare-const X String)
; cojud\x2Edmcast\x2Ecom\sApofis\w+Referer\x3Awww\x2Emirarsearch\x2Ecom
(assert (not (str.in.re X (re.++ (str.to.re "cojud.dmcast.com") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "Apofis") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "Referer:www.mirarsearch.com\x0a")))))
; ^([\w\d\-\.]+)@{1}(([\w\d\-]{1,67})|([\w\d\-]+\.[\w\d\-]{1,67}))\.(([a-zA-Z\d]{2,4})(\.[a-zA-Z\d]{2})?)$
(assert (str.in.re X (re.++ (re.+ (re.union (re.range "0" "9") (str.to.re "-") (str.to.re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) ((_ re.loop 1 1) (str.to.re "@")) (re.union ((_ re.loop 1 67) (re.union (re.range "0" "9") (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.++ (re.+ (re.union (re.range "0" "9") (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re ".") ((_ re.loop 1 67) (re.union (re.range "0" "9") (str.to.re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))))) (str.to.re ".\x0a") ((_ re.loop 2 4) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (re.opt (re.++ (str.to.re ".") ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))))))))
; /^dir=[0-9A-F]{8}(-[0-9A-F]{4}){4}[0-9A-F]{8}&data=/Pi
(assert (not (str.in.re X (re.++ (str.to.re "/dir=") ((_ re.loop 8 8) (re.union (re.range "0" "9") (re.range "A" "F"))) ((_ re.loop 4 4) (re.++ (str.to.re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "A" "F"))))) ((_ re.loop 8 8) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to.re "&data=/Pi\x0a")))))
; Host\x3Aact=Host\x3aUser-Agent\x3AUser-Agent\x3ALiteselect\x2FGet
(assert (not (str.in.re X (str.to.re "Host:act=Host:User-Agent:User-Agent:Liteselect/Get\x0a"))))
; ([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})
(assert (str.in.re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to.re "-") ((_ re.loop 1 2) (re.range "0" "9")) (str.to.re "-") ((_ re.loop 1 2) (re.range "0" "9")) (str.to.re "\x0a"))))
(check-sat)
