(declare-const X String)
; Host\x3Abacktrust\x2EcomconfigINTERNAL\.iniTrojanCurrentDaemonresultsmaster\x2EcomReportMyuntil
(assert (not (str.in.re X (str.to.re "Host:backtrust.comconfigINTERNAL.iniTrojanCurrentDaemonresultsmaster.com\x13ReportMyuntil\x0a"))))
; ^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&%\$#\=~_\-]+))*$
(assert (not (str.in.re X (re.++ (re.opt (re.++ (str.to.re "://") (re.union (re.++ (re.union (str.to.re "H") (str.to.re "h")) (re.union (str.to.re "T") (str.to.re "t"))) (str.to.re "F") (str.to.re "f")) (re.union (str.to.re "T") (str.to.re "t")) (re.union (str.to.re "P") (str.to.re "p")) (re.opt (re.union (str.to.re "S") (str.to.re "s"))))) (re.union (re.++ (str.to.re "www") re.allchar) (re.++ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")) re.allchar)) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to.re "-") (str.to.re "."))) (str.to.re ".") ((_ re.loop 2 6) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.* (re.++ (str.to.re ":") ((_ re.loop 1 5) (re.range "0" "9")))) (re.* (re.++ (str.to.re "/") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to.re ".") (str.to.re ",") (str.to.re ";") (str.to.re "?") (str.to.re "'") (str.to.re "\x5c") (str.to.re "+") (str.to.re "&") (str.to.re "%") (str.to.re "$") (str.to.re "#") (str.to.re "=") (str.to.re "~") (str.to.re "_") (str.to.re "-"))))) (str.to.re "\x0a")))))
; ^\d$
(assert (str.in.re X (re.++ (re.range "0" "9") (str.to.re "\x0a"))))
; ^[A-Z]$
(assert (str.in.re X (re.++ (re.range "A" "Z") (str.to.re "\x0a"))))
(check-sat)
