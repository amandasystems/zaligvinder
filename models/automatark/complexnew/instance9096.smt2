(declare-const X String)
; ^((([sS]|[nN])[a-hA-Hj-zJ-Z])|(([tT]|[oO])[abfglmqrvwABFGLMQRVW])|([hH][l-zL-Z])|([jJ][lmqrvwLMQRVW]))([0-9]{2})?([0-9]{2})?([0-9]{2})?([0-9]{2})?([0-9]{2})?$
(assert (str.in.re X (re.++ (re.union (re.++ (re.union (str.to.re "s") (str.to.re "S") (str.to.re "n") (str.to.re "N")) (re.union (re.range "a" "h") (re.range "A" "H") (re.range "j" "z") (re.range "J" "Z"))) (re.++ (re.union (str.to.re "t") (str.to.re "T") (str.to.re "o") (str.to.re "O")) (re.union (str.to.re "a") (str.to.re "b") (str.to.re "f") (str.to.re "g") (str.to.re "l") (str.to.re "m") (str.to.re "q") (str.to.re "r") (str.to.re "v") (str.to.re "w") (str.to.re "A") (str.to.re "B") (str.to.re "F") (str.to.re "G") (str.to.re "L") (str.to.re "M") (str.to.re "Q") (str.to.re "R") (str.to.re "V") (str.to.re "W"))) (re.++ (re.union (str.to.re "h") (str.to.re "H")) (re.union (re.range "l" "z") (re.range "L" "Z"))) (re.++ (re.union (str.to.re "j") (str.to.re "J")) (re.union (str.to.re "l") (str.to.re "m") (str.to.re "q") (str.to.re "r") (str.to.re "v") (str.to.re "w") (str.to.re "L") (str.to.re "M") (str.to.re "Q") (str.to.re "R") (str.to.re "V") (str.to.re "W")))) (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (str.to.re "\x0a"))))
; /(<\/?)(\w+)([^>]*>)/e
(assert (str.in.re X (re.++ (str.to.re "/") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "/e\x0a<") (re.opt (str.to.re "/")) (re.* (re.comp (str.to.re ">"))) (str.to.re ">"))))
; /filename=[^\n]*\x2ewm/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".wm/i\x0a"))))
; /setInterval\s*\x28[^\x29]+\x2efocus\x28\x29/smi
(assert (str.in.re X (re.++ (str.to.re "/setInterval") (re.* (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "(") (re.+ (re.comp (str.to.re ")"))) (str.to.re ".focus()/smi\x0a"))))
; richfind\x2Ecomdcww\x2Edmcast\x2Ecom
(assert (str.in.re X (str.to.re "richfind.comdcww.dmcast.com\x0a")))
(check-sat)
