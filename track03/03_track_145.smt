(set-logic QF_S)
(declare-fun J () String)
(declare-fun H () String)
(declare-fun K () String)
(declare-fun G () String)
(declare-fun L () String)
(declare-fun O () String)
(declare-fun M () String)
(declare-fun Q () String)
(assert (= (str.++  G "a" G G G G G G G "a" G G "a" G "a" G "a" G "a" G G G G G G G "a" G G "a" G "a" G "b" K "a" K "a" K "a" K K "b" M L "b" M O "b" O)  (str.++  "a" G "aaa" H G "a" G G G "aaa" J K K "aa" J K K "aab" L "aa" L "aab" M M M M "b" Q Q "baa") ))
(check-sat)
(get-model)
