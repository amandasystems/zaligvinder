(declare-const X String)
; "^[A-Z]{1}\d{7}$
(assert (not (str.in.re X (re.++ (str.to.re "\x22") ((_ re.loop 1 1) (re.range "A" "Z")) ((_ re.loop 7 7) (re.range "0" "9")) (str.to.re "\x0a")))))
; (^([A-Za-z])([-_.\dA-Za-z]{1,10})([\dA-Za-z]{1}))(@)(([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})|(([\dA-Za-z{1}][-_.\dA-Za-z]{1,25})\.([A-Za-z]{2,4}))$)
(assert (not (str.in.re X (re.++ (str.to.re "@") (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to.re ".") ((_ re.loop 1 3) (re.range "0" "9")) (str.to.re ".") ((_ re.loop 1 3) (re.range "0" "9")) (str.to.re ".") ((_ re.loop 1 3) (re.range "0" "9"))) (re.++ (str.to.re ".") ((_ re.loop 2 4) (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "{") (str.to.re "1") (str.to.re "}")) ((_ re.loop 1 25) (re.union (str.to.re "-") (str.to.re "_") (str.to.re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z"))))) (str.to.re "\x0a") (re.union (re.range "A" "Z") (re.range "a" "z")) ((_ re.loop 1 10) (re.union (str.to.re "-") (str.to.re "_") (str.to.re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 1 1) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z")))))))
; \x2Fimages\x2Fnocache\x2Ftr\x2Fgca\x2Fm\.gif\?
(assert (str.in.re X (str.to.re "/images/nocache/tr/gca/m.gif?\x0a")))
; /filename=[^\n]*\x2eamf/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".amf/i\x0a")))))
; ^(([1-9]{1}\d{0,2},(\d{3},)*\d{3})|([1-9]{1}\d{0,}))$
(assert (str.in.re X (re.++ (re.union (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 0 2) (re.range "0" "9")) (str.to.re ",") (re.* (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re ","))) ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (re.range "1" "9")) (re.* (re.range "0" "9")))) (str.to.re "\x0a"))))
(check-sat)
