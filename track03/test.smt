(set-logic QF_S)
(declare-fun H() String)
(declare-fun K() String)
(declare-fun I() String)
(declare-fun J() String)
(assert (=(str.++  "a" H  "a" H  "aaaaa" H  "a" H  "a" H  "aaaa" H  "a" H  "aaaaa" H  "a" H  "a" H  "aab" I  "baa" I  "b" J K  "b" K  "")(str.++  "a" H  "a" H  "aa" H  "aa" H H  "a" H  "aa" H H H H H  "a" H  "aaa" H H H  "a" H  "aaab" J  "a" J  "a" J  "a" J  "aba" J  "a" J  "baabaa" "")) )
(assert (=(str.++  "a" H  "a" H  "aaaaa" H  "a" H  "a" H  "aaaa" H  "a" H  "aaaaa" H  "a" H  "a" H  "aab")(str.++  "a" H  "a" H  "aa" H  "aa" H H  "a" H  "aa" H H H H H  "a" H  "aaa" H H H  "a" H  "aaab")) )
(assert (str.in.re H (re.+ (str.to.re "a"))))
(check-sat)
