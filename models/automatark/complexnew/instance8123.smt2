(declare-const X String)
; AdTools\sdownloadfile\x2eorg\w+com\x3E[^\n\r]*as\x2Estarware\x2EcomOS\x2FSSKCstech\x2Eweb-nexus\x2Enet
(assert (not (str.in.re X (re.++ (str.to.re "AdTools") (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d")) (str.to.re "downloadfile.org") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "com>") (re.* (re.union (str.to.re "\x0a") (str.to.re "\x0d"))) (str.to.re "as.starware.comOS/SSKCstech.web-nexus.net\x0a")))))
; ^([0-2]{0,1})([0-3]{1})(\.[0-9]{1,2})?$|^([0-1]{0,1})([0-9]{1})(\.[0-9]{1,2})?$|^-?(24)(\.[0]{1,2})?$|^([0-9]{1})(\.[0-9]{1,2})?$
(assert (str.in.re X (re.union (re.++ (re.opt (re.range "0" "2")) ((_ re.loop 1 1) (re.range "0" "3")) (re.opt (re.++ (str.to.re ".") ((_ re.loop 1 2) (re.range "0" "9"))))) (re.++ (re.opt (re.range "0" "1")) ((_ re.loop 1 1) (re.range "0" "9")) (re.opt (re.++ (str.to.re ".") ((_ re.loop 1 2) (re.range "0" "9"))))) (re.++ (re.opt (str.to.re "-")) (str.to.re "24") (re.opt (re.++ (str.to.re ".") ((_ re.loop 1 2) (str.to.re "0"))))) (re.++ ((_ re.loop 1 1) (re.range "0" "9")) (re.opt (re.++ (str.to.re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (str.to.re "\x0a")))))
; actualnames\.comclient\x2Ebaigoo\x2Ecomzzzvmkituktgr\x2fetiexpsp2-InformationHost\x3A
(assert (not (str.in.re X (str.to.re "actualnames.comclient.baigoo.comzzzvmkituktgr/etiexpsp2-InformationHost:\x0a"))))
(check-sat)
