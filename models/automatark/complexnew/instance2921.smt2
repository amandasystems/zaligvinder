(declare-const X String)
; www\.searchinweb\.com\s+User-Agent\x3Abindmqnqgijmng\x2foj
(assert (not (str.in.re X (re.++ (str.to.re "www.searchinweb.com") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "User-Agent:bindmqnqgijmng/oj\x0a")))))
; aresflashdownloader\x2Ecom%3fccecaedbebfcaf\x2Ecom\stoolbar\.anwb\.nl
(assert (not (str.in.re X (re.++ (str.to.re "aresflashdownloader.com%3fccecaedbebfcaf.com") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "toolbar.anwb.nl\x0a")))))
; /filename=[\x22\x27]?[^\n]*\x2epif[\x22\x27\s]/si
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.opt (re.union (str.to.re "\x22") (str.to.re "'"))) (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".pif") (re.union (str.to.re "\x22") (str.to.re "'") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "/si\x0a"))))
(check-sat)
