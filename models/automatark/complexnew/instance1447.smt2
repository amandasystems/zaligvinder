(declare-const X String)
; /filename=[^\n]*\x2epls/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".pls/i\x0a"))))
; /nsrmm[^\x00]*?([\x3b\x7c\x26\x60]|\x24\x28)/
(assert (not (str.in.re X (re.++ (str.to.re "/nsrmm") (re.* (re.comp (str.to.re "\x00"))) (re.union (str.to.re "$(") (str.to.re ";") (str.to.re "|") (str.to.re "&") (str.to.re "`")) (str.to.re "/\x0a")))))
(check-sat)
