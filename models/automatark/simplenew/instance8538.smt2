(declare-const X String)
; ^((0{1})?([0-3]{0,1}))(\.[0-9]{0,2})?$|^(4)(\.[0]{1,2})?$|^((0{1})?([0-4]{0,1}))(\.)?$
(assert (str.in.re X (re.union (re.++ (re.opt (re.++ (str.to.re ".") ((_ re.loop 0 2) (re.range "0" "9")))) (re.opt ((_ re.loop 1 1) (str.to.re "0"))) (re.opt (re.range "0" "3"))) (re.++ (str.to.re "4") (re.opt (re.++ (str.to.re ".") ((_ re.loop 1 2) (str.to.re "0"))))) (re.++ (re.opt (str.to.re ".")) (str.to.re "\x0a") (re.opt ((_ re.loop 1 1) (str.to.re "0"))) (re.opt (re.range "0" "4"))))))
(check-sat)
