(declare-const X String)
; emailFrom\x3AUser-Agent\x3AUser-Agent\x3Aselect\x2FGet
(assert (str.in.re X (str.to.re "emailFrom:User-Agent:User-Agent:select/Get\x0a")))
; Online\x2521\x2521\x2521\sUser-Agent\x3A\d+HXDownloadasdbiz\x2Ebiz
(assert (str.in.re X (re.++ (str.to.re "Online%21%21%21") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "User-Agent:") (re.+ (re.range "0" "9")) (str.to.re "HXDownloadasdbiz.biz\x0a"))))
(check-sat)
