(declare-const X String)
; \<img ((src|height|width|border)=:q:Wh*)*/\>
(assert (str.in.re X (re.++ (str.to.re "<img ") (re.* (re.++ (re.union (str.to.re "src") (str.to.re "height") (str.to.re "width") (str.to.re "border")) (str.to.re "=:q:W") (re.* (str.to.re "h")))) (str.to.re "/>\x0a"))))
(check-sat)
