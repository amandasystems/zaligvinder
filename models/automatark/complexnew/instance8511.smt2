(declare-const X String)
; isSAH\*Agentwww\.raxsearch\.comHost\x3A-~-\x22The
(assert (str.in.re X (str.to.re "isSAH*Agentwww.raxsearch.comHost:-~-\x22The\x0a")))
; ^[0-9]{2,3}-? ?[0-9]{6,7}$
(assert (str.in.re X (re.++ ((_ re.loop 2 3) (re.range "0" "9")) (re.opt (str.to.re "-")) (re.opt (str.to.re " ")) ((_ re.loop 6 7) (re.range "0" "9")) (str.to.re "\x0a"))))
(check-sat)
