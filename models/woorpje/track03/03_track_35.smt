(set-logic QF_S)
(declare-fun S () String)
(declare-fun J () String)
(declare-fun T () String)
(declare-fun R () String)
(declare-fun K () String)
(declare-fun H () String)
(declare-fun L () String)
(declare-fun M () String)
(declare-fun Z () String)
(declare-fun P () String)
(assert (= (str.++  K "aaa" J "a" K "aaa" J "b" L M "ab" R P R "ab" S S "b")  (str.++  "a" H K "a" M "aa" M M M "aa" M M "b" P R R "a" P R R "ab" S T S T "b" Z Z "baa") ))
(check-sat)
(get-model)