(set-logic QF_S)
(declare-fun D () String)
(declare-fun J () String)
(assert (= (str.++  "bbaabbbacb" J "ccbccccbabaacbabaabbaacbbacaaaaabcbabccccbccaabacbbccbcbaa" D)  (str.++  "bbaabbbacbbbbbcbcbcacbbab" D "aabaaabac" D "bbcbbcacccbb" D "accabbaabcccc" D "accbccccbabaacbabaabbaacbbacaaaaabcbabccccbc" D "abacbbccbcbaaca") ))
(check-sat)
(get-model)