(declare-const X String)
; <title>(.*?)</title>
(assert (str.in.re X (re.++ (str.to.re "<title>") (re.* re.allchar) (str.to.re "</title>\x0a"))))
(check-sat)
