(declare-const X String)
; ^([+]39)?((38[{8,9}|0])|(34[{7-9}|0])|(36[6|8|0])|(33[{3-9}|0])|(32[{8,9}]))([\d]{7})$
(assert (not (str.in.re X (re.++ (re.opt (str.to.re "+39")) (re.union (re.++ (str.to.re "38") (re.union (str.to.re "{") (str.to.re "8") (str.to.re ",") (str.to.re "9") (str.to.re "}") (str.to.re "|") (str.to.re "0"))) (re.++ (str.to.re "34") (re.union (str.to.re "{") (re.range "7" "9") (str.to.re "}") (str.to.re "|") (str.to.re "0"))) (re.++ (str.to.re "36") (re.union (str.to.re "6") (str.to.re "|") (str.to.re "8") (str.to.re "0"))) (re.++ (str.to.re "33") (re.union (str.to.re "{") (re.range "3" "9") (str.to.re "}") (str.to.re "|") (str.to.re "0"))) (re.++ (str.to.re "32") (re.union (str.to.re "{") (str.to.re "8") (str.to.re ",") (str.to.re "9") (str.to.re "}")))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to.re "\x0a")))))
; tv\x2E180solutions\x2EcomGirlFriendHost\x3A
(assert (str.in.re X (str.to.re "tv.180solutions.comGirlFriendHost:\x0a")))
(check-sat)
