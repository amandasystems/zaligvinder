(set-logic QF_S)
(declare-fun H () String)
(declare-fun G () String)
(declare-fun E () String)
(assert (= (str.++  "abcaccccccab" E "bc" E "ccacbca" E "caaaa" E "cbacccacbcbccaaa" E "abccccac" H)  (str.++  "abc" G) ))
(check-sat)
(get-model)