(declare-const X String)
; /\?java\=[0-9]{2,6}$/U
(assert (str.in.re X (re.++ (str.to.re "/?java=") ((_ re.loop 2 6) (re.range "0" "9")) (str.to.re "/U\x0a"))))
; </?(\w+)(\s*\w*\s*=\s*("[^"]*"|';[^';]';|[^>]*))*|/?>
(assert (not (str.in.re X (re.union (re.++ (str.to.re "<") (re.opt (str.to.re "/")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.* (re.++ (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "=") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (re.union (re.++ (str.to.re "\x22") (re.* (re.comp (str.to.re "\x22"))) (str.to.re "\x22")) (re.++ (str.to.re "';") (re.union (str.to.re "'") (str.to.re ";")) (str.to.re "';")) (re.* (re.comp (str.to.re ">"))))))) (re.++ (re.opt (str.to.re "/")) (str.to.re ">\x0a"))))))
(check-sat)
