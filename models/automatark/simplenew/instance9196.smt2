(declare-const X String)
; ed2k\xc0STATUS\xc0Server\x7D\x7BPort\x3Ahttp\x3A\x2F\x2Ftv\x2Eseekmo\x2Ecom\x2Fshowme\x2Easpx\x3Fkeyword=
(assert (str.in.re X (str.to.re "ed2k\xc0STATUS\xc0Server\x13}{Port:http://tv.seekmo.com/showme.aspx?keyword=\x0a")))
(check-sat)
