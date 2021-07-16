(declare-const X String)
; /\/[a-z]+\?[a-z]+\=[a-z]+$/U
(assert (not (str.in.re X (re.++ (str.to.re "//") (re.+ (re.range "a" "z")) (str.to.re "?") (re.+ (re.range "a" "z")) (str.to.re "=") (re.+ (re.range "a" "z")) (str.to.re "/U\x0a")))))
; /xsl\x3Atemplate[^\x3E]*priority\s*\x3D[\s\x22\x27]*[\d\x2D]*[^\s\x22\x27\d\x2d]/smi
(assert (str.in.re X (re.++ (str.to.re "/xsl:template") (re.* (re.comp (str.to.re ">"))) (str.to.re "priority") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "=") (re.* (re.union (str.to.re "\x22") (str.to.re "'") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.* (re.union (re.range "0" "9") (str.to.re "-"))) (re.union (str.to.re "\x22") (str.to.re "'") (re.range "0" "9") (str.to.re "-") (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "/smi\x0a"))))
; /Content-Disposition\x3a\x20inline\x3b[^\x0d\x0a]filename=[a-z]{5,8}\d{2,3}\.pdf\x0d\x0a/Hm
(assert (str.in.re X (re.++ (str.to.re "/Content-Disposition: inline;") (re.union (str.to.re "\x0d") (str.to.re "\x0a")) (str.to.re "filename=") ((_ re.loop 5 8) (re.range "a" "z")) ((_ re.loop 2 3) (re.range "0" "9")) (str.to.re ".pdf\x0d\x0a/Hm\x0a"))))
(check-sat)
