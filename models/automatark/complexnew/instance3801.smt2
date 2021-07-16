(declare-const X String)
; /\x2eani([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.ani") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
; OVN\s+\x2APORT3\x2A\[DRIVEwww\.raxsearch\.com
(assert (str.in.re X (re.++ (str.to.re "OVN") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "*PORT3*[DRIVEwww.raxsearch.com\x0a"))))
; /\x2eabc([\?\x5c\x2f]|$)/smiU
(assert (str.in.re X (re.++ (str.to.re "/.abc") (re.union (str.to.re "?") (str.to.re "\x5c") (str.to.re "/")) (str.to.re "/smiU\x0a"))))
; /\x3fsv\x3d\d{1,3}\x26tq\x3d/smiU
(assert (not (str.in.re X (re.++ (str.to.re "/?sv=") ((_ re.loop 1 3) (re.range "0" "9")) (str.to.re "&tq=/smiU\x0a")))))
; /filename=[^\n]*\x2ewk4/i
(assert (str.in.re X (re.++ (str.to.re "/filename=") (re.* (re.comp (str.to.re "\x0a"))) (str.to.re ".wk4/i\x0a"))))
(check-sat)
