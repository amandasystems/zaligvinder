(declare-const X String)
; /\&k=\d+($|\&h=)/U
(assert (not (str.in.re X (re.++ (str.to.re "/&k=") (re.+ (re.range "0" "9")) (str.to.re "&h=/U\x0a")))))
; (Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|(Nov|Dec)(ember)?)
(assert (str.in.re X (re.++ (re.union (re.++ (str.to.re "Jan") (re.opt (str.to.re "uary"))) (re.++ (str.to.re "Feb") (re.opt (str.to.re "ruary"))) (re.++ (str.to.re "Mar") (re.opt (str.to.re "ch"))) (re.++ (str.to.re "Apr") (re.opt (str.to.re "il"))) (str.to.re "May") (re.++ (str.to.re "Jun") (re.opt (str.to.re "e"))) (re.++ (str.to.re "Jul") (re.opt (str.to.re "y"))) (re.++ (str.to.re "Aug") (re.opt (str.to.re "ust"))) (re.++ (str.to.re "Sep") (re.opt (str.to.re "tember"))) (re.++ (str.to.re "Oct") (re.opt (str.to.re "ober"))) (re.++ (re.union (str.to.re "Nov") (str.to.re "Dec")) (re.opt (str.to.re "ember")))) (str.to.re "\x0a"))))
(check-sat)
