(set-logic QF_S)
(declare-fun C () String)
(declare-fun G () String)
(declare-fun E () String)
(declare-fun A () String)
(assert (= (str.++  "a" E "ca" A "ccbccaabaccbbbcbbaabccbccbbabcbab")  (str.++  "ab" C G "ab") ))
(check-sat)
(get-model)
