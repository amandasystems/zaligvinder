(declare-const X String)
; ^\d{9}[\d|X]$
(assert (not (str.in.re X (re.++ ((_ re.loop 9 9) (re.range "0" "9")) (re.union (re.range "0" "9") (str.to.re "|") (str.to.re "X")) (str.to.re "\x0a")))))
; /^hello\/[0-9]\.[0-9]\/[0-9]{3}\/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i
(assert (not (str.in.re X (re.++ (str.to.re "/hello/") (re.range "0" "9") (str.to.re ".") (re.range "0" "9") (str.to.re "/") ((_ re.loop 3 3) (re.range "0" "9")) (str.to.re "/") ((_ re.loop 8 8) (re.union (re.range "0" "9") (re.range "a" "f"))) (str.to.re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "a" "f"))) (str.to.re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "a" "f"))) (str.to.re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "a" "f"))) (str.to.re "-") ((_ re.loop 12 12) (re.union (re.range "0" "9") (re.range "a" "f"))) (str.to.re "/i\x0a")))))
(check-sat)
