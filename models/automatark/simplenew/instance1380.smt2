(declare-const X String)
; Host\x3A\s+jsp\s+User-Agent\x3Au=serverFILE\x2Fxml\x2Ftoolbar\x2Fcheck=at\x3a
(assert (str.in.re X (re.++ (str.to.re "Host:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "jsp") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "User-Agent:u=serverFILE/xml/toolbar/check=at:\x0a"))))
(check-sat)
