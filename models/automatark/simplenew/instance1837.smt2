(declare-const X String)
; /^\/[0-9]{8}\.html$/U
(assert (str.in.re X (re.++ (str.to.re "//") ((_ re.loop 8 8) (re.range "0" "9")) (str.to.re ".html/U\x0a"))))
(check-sat)
