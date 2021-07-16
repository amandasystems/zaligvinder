(declare-const X String)
; Minutes\s+\x2Fcgi\x2Flogurl\.cgi\s+e2give\.com
(assert (str.in.re X (re.++ (str.to.re "Minutes") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "/cgi/logurl.cgi") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "e2give.com\x0a"))))
; ^((0?[1-9])|(([1|2]\d)|(3[0|1])))(/|-)((0?[1-9])|(1[0|1|2]))(/|-)(((19|20)\d\d)|(\d\d))
(assert (not (str.in.re X (re.++ (re.union (re.++ (re.opt (str.to.re "0")) (re.range "1" "9")) (re.++ (re.union (str.to.re "1") (str.to.re "|") (str.to.re "2")) (re.range "0" "9")) (re.++ (str.to.re "3") (re.union (str.to.re "0") (str.to.re "|") (str.to.re "1")))) (re.union (str.to.re "/") (str.to.re "-")) (re.union (re.++ (re.opt (str.to.re "0")) (re.range "1" "9")) (re.++ (str.to.re "1") (re.union (str.to.re "0") (str.to.re "|") (str.to.re "1") (str.to.re "2")))) (re.union (str.to.re "/") (str.to.re "-")) (re.union (re.++ (re.union (str.to.re "19") (str.to.re "20")) (re.range "0" "9") (re.range "0" "9")) (re.++ (re.range "0" "9") (re.range "0" "9"))) (str.to.re "\x0a")))))
; ^\d+([^.,])?$
(assert (str.in.re X (re.++ (re.+ (re.range "0" "9")) (re.opt (re.union (str.to.re ".") (str.to.re ","))) (str.to.re "\x0a"))))
; zzzvmkituktgr\x2fetie\sHost\x3ASoftActivityYeah\!whenu\x2Ecom
(assert (not (str.in.re X (re.++ (str.to.re "zzzvmkituktgr/etie") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "Host:SoftActivity\x13Yeah!whenu.com\x1b\x0a")))))
(check-sat)
