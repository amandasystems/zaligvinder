(declare-const X String)
; Filtered\s+Yeah\!\d+HXDownloadasdbiz\x2EbizUser-Agent\x3Awww\x2Eezula\x2EcomUser-Agent\x3aetbuviaebe\x2feqv\.bvv
(assert (str.in.re X (re.++ (str.to.re "Filtered") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Yeah!") (re.+ (re.range "0" "9")) (str.to.re "HXDownloadasdbiz.bizUser-Agent:www.ezula.comUser-Agent:etbuviaebe/eqv.bvv\x0a"))))
(check-sat)
