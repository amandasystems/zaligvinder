(declare-const X String)
; User-Agent\x3A\s+Host\x3Acdpnode=FILESIZE\x3Etoolsbar\x2Ekuaiso\x2Ecom
(assert (not (str.in.re X (re.++ (str.to.re "User-Agent:") (re.+ (re.union (str.to.re " ") (str.to.re "\x09") (str.to.re "\x0a") (str.to.re "\x0c") (str.to.re "\x0d"))) (str.to.re "Host:cdpnode=FILESIZE>\x13toolsbar.kuaiso.com\x0a")))))
; X-FILTERED-BY-GHOST\x3a\d+yxegtd\x2fefcwgHost\x3ATPSystem
(assert (not (str.in.re X (re.++ (str.to.re "X-FILTERED-BY-GHOST:") (re.+ (re.range "0" "9")) (str.to.re "yxegtd/efcwgHost:TPSystem\x0a")))))
(check-sat)
