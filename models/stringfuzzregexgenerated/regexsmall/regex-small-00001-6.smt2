(set-logic QF_S)
(declare-fun var0 () String)
(assert (str.in.re var0 (re.union (re.union (str.to.re "0") (str.to.re "1")) (re.+ (str.to.re "22")))))
(check-sat)