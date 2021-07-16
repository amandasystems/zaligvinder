(declare-const X String)
; ^[\d]{3}[\s\-]*[\d]{3}[\s\-]*[\d]{4}\s*$
(assert (str.in.re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.* (re.union (str.to.re "-") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.* (re.union (str.to.re "-") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) ((_ re.loop 4 4) (re.range "0" "9")) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "\x0a"))))
; Toolbar\dcount\x2Eyok\x2EcomweatherHost\x3AUser-Agent\x3A
(assert (not (str.in.re X (re.++ (str.to.re "Toolbar") (re.range "0" "9") (str.to.re "count.yok.comweatherHost:User-Agent:\x0a")))))
; bar\-navig\x2Eyandex\x2Eru\s+
(assert (not (str.in.re X (re.++ (str.to.re "bar-navig.yandex.ru") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "\x0a")))))
(check-sat)
