(declare-const X String)
; /filename=[^&]*?(\x2e|%2e){2}([\x2f\x5c]|%2f|%5c)/Pi
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "&"))) ((_ re.loop 2 2) (re.union (str.to.re ".") (str.to.re "%2e"))) (re.union (str.to.re "%2f") (str.to.re "%5c") (str.to.re "/") (str.to.re "\x5c")) (str.to.re "/Pi\x0a"))))
(check-sat)
