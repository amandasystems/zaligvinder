(declare-const X String)
; User-Agent\x3A\w+Minutes\d+www\x2Eeblocs\x2EcomHost\x3ARunnerHost\x3a\x2Ehtmldll\x3F
(assert (str.in.re X (re.++ (str.to.re "User-Agent:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (str.to.re "Minutes") (re.+ (re.range "0" "9")) (str.to.re "www.eblocs.com\x1bHost:RunnerHost:.htmldll?\x0a"))))
; ^[\w]{3}(p|P|c|C|h|H|f|F|a|A|t|T|b|B|l|L|j|J|g|G)[\w][\d]{4}[\w]$
(assert (str.in.re X (re.++ ((_ re.loop 3 3) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_"))) (re.union (str.to.re "p") (str.to.re "P") (str.to.re "c") (str.to.re "C") (str.to.re "h") (str.to.re "H") (str.to.re "f") (str.to.re "F") (str.to.re "a") (str.to.re "A") (str.to.re "t") (str.to.re "T") (str.to.re "b") (str.to.re "B") (str.to.re "l") (str.to.re "L") (str.to.re "j") (str.to.re "J") (str.to.re "g") (str.to.re "G")) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_")) ((_ re.loop 4 4) (re.range "0" "9")) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to.re "_")) (str.to.re "\x0a"))))
; myway\.comzmnjgmomgbdz\x2fzzmw\.gztUser-Agent\x3A
(assert (not (str.in.re X (str.to.re "myway.comzmnjgmomgbdz/zzmw.gztUser-Agent:\x0a"))))
; ['`~!@#&$%^&*()-_=+{}|?><,.:;{}\"\\/\\[\\]]
(assert (not (str.in.re X (re.++ (re.union (str.to.re "'") (str.to.re "`") (str.to.re "~") (str.to.re "!") (str.to.re "@") (str.to.re "#") (str.to.re "&") (str.to.re "$") (str.to.re "%") (str.to.re "^") (str.to.re "*") (str.to.re "(") (re.range ")" "_") (str.to.re "=") (str.to.re "+") (str.to.re "{") (str.to.re "}") (str.to.re "|") (str.to.re "?") (str.to.re ">") (str.to.re "<") (str.to.re ",") (str.to.re ".") (str.to.re ":") (str.to.re ";") (str.to.re "\x22") (str.to.re "\x5c") (str.to.re "/") (str.to.re "[")) (str.to.re "]\x0a")))))
; /\xF6\xEC\xD9\xB3\x67\xCF\x9E\x3D\x7B(\xF6\xEC\xD9\xB3\x67\xCF\x9E\x3D\x7B){500}/m
(assert (str.in.re X (re.++ (str.to.re "/\xf6\xec\xd9\xb3g\xcf\x9e={") ((_ re.loop 500 500) (str.to.re "\xf6\xec\xd9\xb3g\xcf\x9e={")) (str.to.re "/m\x0a"))))
(check-sat)
