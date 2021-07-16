(declare-const X String)
; ([A-HJ-PR-Y]{2}([0][1-9]|[1-9][0-9])|[A-HJ-PR-Y]{1}([1-9]|[1-2][0-9]|30|31|33|40|44|55|50|60|66|70|77|80|88|90|99|111|121|123|222|321|333|444|555|666|777|888|999|100|200|300|400|500|600|700|800|900))[ ][A-HJ-PR-Z]{3}$
(assert (not (str.in.re X (re.++ (re.union (re.++ ((_ re.loop 2 2) (re.union (re.range "A" "H") (re.range "J" "P") (re.range "R" "Y"))) (re.union (re.++ (str.to.re "0") (re.range "1" "9")) (re.++ (re.range "1" "9") (re.range "0" "9")))) (re.++ ((_ re.loop 1 1) (re.union (re.range "A" "H") (re.range "J" "P") (re.range "R" "Y"))) (re.union (re.range "1" "9") (re.++ (re.range "1" "2") (re.range "0" "9")) (str.to.re "30") (str.to.re "31") (str.to.re "33") (str.to.re "40") (str.to.re "44") (str.to.re "55") (str.to.re "50") (str.to.re "60") (str.to.re "66") (str.to.re "70") (str.to.re "77") (str.to.re "80") (str.to.re "88") (str.to.re "90") (str.to.re "99") (str.to.re "111") (str.to.re "121") (str.to.re "123") (str.to.re "222") (str.to.re "321") (str.to.re "333") (str.to.re "444") (str.to.re "555") (str.to.re "666") (str.to.re "777") (str.to.re "888") (str.to.re "999") (str.to.re "100") (str.to.re "200") (str.to.re "300") (str.to.re "400") (str.to.re "500") (str.to.re "600") (str.to.re "700") (str.to.re "800") (str.to.re "900")))) (str.to.re " ") ((_ re.loop 3 3) (re.union (re.range "A" "H") (re.range "J" "P") (re.range "R" "Z"))) (str.to.re "\x0a")))))
; downloadfile\x2eorg\w+com\x3EHost\x3A
(assert (not (str.in.re X (re.++ (str.to.re "downloadfile.org") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "com>Host:\x0a")))))
; SSKCstech\x2Eweb-nexus\x2Enet
(assert (str.in.re X (str.to.re "SSKCstech.web-nexus.net\x0a")))
; /\x2epif([\?\x5c\x2f]|$)/smiU
(assert (not (str.in.re X (re.++ (str.to.re "/.pif") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a")))))
; ^[a-zA-Z0-9._\-]+@[a-z0-9\-]+(\.[a-z]+){1,}$
(assert (str.in.re X (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to.re ".") (str.to.re "_") (str.to.re "-"))) (str.to.re "@") (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to.re "-"))) (re.+ (re.++ (str.to.re ".") (re.+ (re.range "a" "z")))) (str.to.re "\x0a"))))
(check-sat)
