(declare-const X String)
; [\w*|\W*]*<[[\w*|\W*]*|/[\w*|\W*]]>[\w*|\W*]*
(assert (str.in.re X (re.union (re.++ (re.* (re.union (str.to.re "*") (str.to.re "|") (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "<") (re.* (re.union (str.to.re "[") (str.to.re "*") (str.to.re "|") (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_")))) (re.++ (str.to.re "/") (re.union (str.to.re "*") (str.to.re "|") (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_")) (str.to.re "]>") (re.* (re.union (str.to.re "*") (str.to.re "|") (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "\x0a")))))
; User-Agent\x3Aupgrade\x2Eqsrch\x2Einfo
(assert (str.in.re X (str.to.re "User-Agent:upgrade.qsrch.info\x0a")))
(check-sat)
