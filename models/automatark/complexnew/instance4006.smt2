(declare-const X String)
; LIST\]SpamBlockerUtilityTry2FindBasicHost\x3AUser-Agent\x3AAcmeprotocolSpy
(assert (not (str.in.re X (str.to.re "LIST]SpamBlockerUtilityTry2FindBasicHost:User-Agent:AcmeprotocolSpy\x0a"))))
; /Referer\x3a\s*?http\x3a\x2f{2}[a-z0-9\x2e\x2d]+\x2fs\x2f\x3fk\x3d/Hi
(assert (not (str.in.re X (re.++ (str.to.re "/Referer:") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "http:") ((_ re.loop 2 2) (str.to.re "/")) (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to.re ".") (str.to.re "-"))) (str.to.re "/s/?k=/Hi\x0a")))))
(check-sat)
