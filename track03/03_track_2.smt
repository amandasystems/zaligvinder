(set-logic QF_S)
(declare-fun H () String)
(declare-fun K () String)
(declare-fun I () String)
(assert (= (str.++  "aaaaaaa" H "aaaaaaaaaa" H "aab" I I I "aab" I I I "abaaba")  (str.++  "a" H H "aa" I "aaaa" I I "aaaa" I "b" I "aa" I I "aa" I "b" K K K K "b" K K "baa") ))
(check-sat)
(get-model)
