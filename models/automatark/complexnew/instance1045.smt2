(declare-const X String)
; ^([(]?[+]{1}[0-9]{1,3}[)]?[ .\-]?)?[(]?[0-9]{3}[)]?[ .\-]?([0-9]{3}[ .\-]?[0-9]{4}|[a-zA-Z0-9]{7})([ .\-]?[/]{1}[ .\-]?[0-9]{2,4})?$
(assert (not (str.in.re X (re.++ (re.opt (re.++ (re.opt (str.to.re "(")) ((_ re.loop 1 1) (str.to.re "+")) ((_ re.loop 1 3) (re.range "0" "9")) (re.opt (str.to.re ")")) (re.opt (re.union (str.to.re " ") (str.to.re ".") (str.to.re "-"))))) (re.opt (str.to.re "(")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to.re ")")) (re.opt (re.union (str.to.re " ") (str.to.re ".") (str.to.re "-"))) (re.union (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to.re " ") (str.to.re ".") (str.to.re "-"))) ((_ re.loop 4 4) (re.range "0" "9"))) ((_ re.loop 7 7) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")))) (re.opt (re.++ (re.opt (re.union (str.to.re " ") (str.to.re ".") (str.to.re "-"))) ((_ re.loop 1 1) (str.to.re "/")) (re.opt (re.union (str.to.re " ") (str.to.re ".") (str.to.re "-"))) ((_ re.loop 2 4) (re.range "0" "9")))) (str.to.re "\x0a")))))
; hg diff --nodates | egrep -e "---" -v | egrep -e "^-" -c
(assert (not (str.in.re X (re.union (str.to.re "hg diff --nodates ") (str.to.re " egrep -e \x22---\x22 -v ") (str.to.re " egrep -e \x22-\x22 -c\x0a")))))
; /\/stat_n\/$/U
(assert (not (str.in.re X (str.to.re "//stat_n//U\x0a"))))
(check-sat)
