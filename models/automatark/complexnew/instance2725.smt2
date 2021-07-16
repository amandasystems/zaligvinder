(declare-const X String)
; ^(((Ctrl\+Shift\+Alt\+|Ctrl\+Shift\+|Ctrl\+Alt\+|Shift\+Alt\+|Ctrl\+|Alt\+){1}(F1[0-2]|F[1-9]|[A-Za-z0-9\-\=\[\]\\\;\'\,\.\/]){1}){1}|(Shift\+)?(F1[0-2]|F[1-9]){1})$
(assert (str.in.re X (re.++ (re.union ((_ re.loop 1 1) (re.++ ((_ re.loop 1 1) (re.union (str.to.re "Ctrl+Shift+Alt+") (str.to.re "Ctrl+Shift+") (str.to.re "Ctrl+Alt+") (str.to.re "Shift+Alt+") (str.to.re "Ctrl+") (str.to.re "Alt+"))) ((_ re.loop 1 1) (re.union (re.++ (str.to.re "F1") (re.range "0" "2")) (re.++ (str.to.re "F") (re.range "1" "9")) (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9") (str.to.re "-") (str.to.re "=") (str.to.re "[") (str.to.re "]") (str.to.re "\x5c") (str.to.re ";") (str.to.re "'") (str.to.re ",") (str.to.re ".") (str.to.re "/"))))) (re.++ (re.opt (str.to.re "Shift+")) ((_ re.loop 1 1) (re.++ (str.to.re "F") (re.union (re.++ (str.to.re "1") (re.range "0" "2")) (re.range "1" "9")))))) (str.to.re "\x0a"))))
; /\&k=\d+($|\&h=)/U
(assert (not (str.in.re X (re.++ (str.to.re "/&k=") (re.+ (re.range "0" "9")) (str.to.re "&h=/U\x0a")))))
; /filename=[^\n]*\x2exspf/i
(assert (not (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".xspf/i\x0a")))))
; ^[1-9][0-9][0-9][0-9]$
(assert (not (str.in.re X (re.++ (re.range "1" "9") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9") (str.to.re "\x0a")))))
(check-sat)
