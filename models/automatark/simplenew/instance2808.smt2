(declare-const X String)
; info\s+wjpropqmlpohj\x2flo\s+resultsmaster\x2Ecom\x7croogoo\x7c
(assert (str.in.re X (re.++ (str.to.re "info") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "wjpropqmlpohj/lo") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "resultsmaster.com\x13|roogoo|\x0a"))))
(check-sat)
