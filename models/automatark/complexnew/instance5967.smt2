(declare-const X String)
; Host\x3A\w+www.*ToolbartheServer\x3Awww\x2Esearchreslt\x2Ecom
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "www") (re.* re.allchar) (str.to.re "ToolbartheServer:www.searchreslt.com\x0a"))))
; (href=|url|import).*[\'"]([^(http:)].*css)[\'"]
(assert (str.in.re X (re.++ (re.union (str.to.re "href=") (str.to.re "url") (str.to.re "import")) (re.* re.allchar) (re.union (str.to.re "'") (str.to.re "\x22")) (re.union (str.to.re "'") (str.to.re "\x22")) (str.to.re "\x0a") (re.union (str.to.re "(") (str.to.re "h") (str.to.re "t") (str.to.re "p") (str.to.re ":") (str.to.re ")")) (re.* re.allchar) (str.to.re "css"))))
; [0-1]+
(assert (str.in.re X (re.++ (re.+ (re.range "0" "1")) (str.to.re "\x0a"))))
(check-sat)
