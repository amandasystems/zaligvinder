(set-logic QF_S)
(declare-fun B () String)
(declare-fun D () String)
(declare-fun E () String)
(assert (= (str.++  "abcaaababb" D "c")  (str.++  "abcaaabab" E) ))
(assert (= (str.++  "bccacbacabbbacb" B "aa")  (str.++  "bccacbacabbbacbaabbbaa" "") ))
(assert (= (str.++  "a" B "babbccabcccbabba")  (str.++  "aaabbbbabbccabcccbabba" "") ))
(assert (= (str.++  "cacaaabbbcabbabaacbaca" "")  (str.++  "caca" B "cabbabaacbaca") ))
(assert (= (str.++  "ccac" B "bcaaaacaccccc")  (str.++  "ccacaabbbbcaaaacaccccc" "") ))
(assert (= (str.++  "ba" B "bcccacbbcabccca")  (str.++  "baaabbbbcccacbbcabccca" "") ))
(assert (= (str.++  "bcac" B "cbccbcabcccca")  (str.++  "bcac" B "cbccbcabcccca") ))
(assert (= (str.++  "abacbbbabbbbbb" B "bbb")  (str.++  "abacbbbabbbbbbaabbbbbb" "") ))
(assert (= (str.++  "acba" B "cccaacaaacbbc")  (str.++  "acbaaabbbcccaacaaacbbc" "") ))
(assert (= (str.++  "baabb" B "bbbbbaccabaa")  (str.++  "baabb" B "bbbbbaccabaa") ))
(assert (= (str.++  "a" B "acbaccaccbbccacc")  (str.++  "a" B "acbaccaccbbccacc") ))
(assert (= (str.++  "baccccabbaab" B "bccbc")  (str.++  "baccccabbaab" B "bccbc") ))
(assert (= (str.++  "cbcaababbbabbaabbbcbcc" "")  (str.++  "cbcaababbbabb" B "cbcc") ))
(assert (= (str.++  "bbccbacab" B "acbcbacc")  (str.++  "bbccbacab" B "acbcbacc") ))
(assert (= (str.++  "bcbcc" B "bbbcbaaacbac")  (str.++  "bcbcc" B "bbbcbaaacbac") ))
(assert (= (str.++  "babaaccabccbbbcaaabbbc" "")  (str.++  "babaaccabccbbbca" B "c") ))
(assert (= (str.++  "cabbcbab" B "ccaaacbca")  (str.++  "cabbcbab" B "ccaaacbca") ))
(assert (= (str.++  "acbbccb" B "bcbbabcabb")  (str.++  "acbbccbaabbbbcbbabcabb" "") ))
(assert (= (str.++  "baacbcbcbbba" B "abbab")  (str.++  "baacbcbcbbbaaabbbabbab" "") ))
(assert (= (str.++  "abcbacbcabbcbbcabaabbb" "")  (str.++  "abcbacbcabbcbbcab" B) ))
(assert (= (str.++  "bbaabacabccb" B "cbcbb")  (str.++  "bbaabacabccb" B "cbcbb") ))
(assert (= (str.++  "cabbaaaccbbacb" B "bbb")  (str.++  "cabbaaaccbbacbaabbbbbb" "") ))
(assert (= (str.++  "aa" B "cccacccabbbbbcb")  (str.++  "aa" B "cccacccabbbbbcb") ))
(assert (= (str.++  "acbacbcacbaca" B "abca")  (str.++  "acbacbcacbaca" B "abca") ))
(assert (= (str.++  "abacbcccbb" B "cacccac")  (str.++  "abacbcccbbaabbbcacccac" "") ))
(assert (= (str.++  "bccabaabbbbbbcabcbabcc" "")  (str.++  "bccab" B "bbbcabcbabcc") ))
(assert (= (str.++  "aacbac" B "cbaacbaacaa")  (str.++  "aacbacaabbbcbaacbaacaa" "") ))
(assert (= (str.++  "cbaa" B "accabcccbcccc")  (str.++  "cbaa" B "accabcccbcccc") ))
(assert (= (str.++  "babbbbaabbbbccccbcaaaa" "")  (str.++  "babbbb" B "bccccbcaaaa") ))
(assert (= (str.++  "bcb" B "baaaccccaabbba")  (str.++  "bcbaabbbbaaaccccaabbba" "") ))
(assert (= (str.++  "cbca" B "baabcbccbacab")  (str.++  "cbcaaabbbbaabcbccbacab" "") ))
(assert (= (str.++  "acbcacacaabbbaccacabbb" "")  (str.++  "acbcacac" B "accacabbb") ))
(assert (= (str.++  "babcabaccacaaaaaabbbcb" "")  (str.++  "babcabaccacaaaa" B "cb") ))
(assert (= (str.++  "accbbaacbcbcbccbc" B)  (str.++  "accbbaacbcbcbccbc" B) ))
(assert (= (str.++  "baaaaabbbccbacaccbbacb" "")  (str.++  "baaa" B "ccbacaccbbacb") ))
(assert (= (str.++  "ccbbbacaacabbb" B "aab")  (str.++  "ccbbbacaacabbbaabbbaab" "") ))
(assert (= (str.++  "aabbbacaacbbbcbaabbabb" "")  (str.++  B "acaacbbbcbaabbabb" "") ))
(assert (= (str.++  "acbccaba" B "cabbccabc")  (str.++  "acbccabaaabbbcabbccabc" "") ))
(assert (= (str.++  "abbbcbbcbbbbacaabbbbba" "")  (str.++  "abbbcbbcbbbbac" B "bba") ))
(assert (= (str.++  "aa" B "aacbacbbbaabcbc")  (str.++  "aaaabbbaacbacbbbaabcbc" "") ))
(assert (= (str.++  "baaaaccaca" B "bbcbaac")  (str.++  "baaaaccaca" B "bbcbaac") ))
(assert (= (str.++  "abcaabbbaaccbcaabbabbb" "")  (str.++  "abc" B "aaccbcaabbabbb") ))
(assert (= (str.++  "acbbbacbaabbbaabaccbbb" "")  (str.++  "acbbbacb" B "aabaccbbb") ))
(assert (= (str.++  "accaabbcbc" B "cbbaaba")  (str.++  "accaabbcbcaabbbcbbaaba" "") ))
(assert (= (str.++  "babaccbacaaabbcaabbbbb" "")  (str.++  "babaccbacaaabbc" B "bb") ))
(assert (= (str.++  "cacacaabbbbbaccbbacbba" "")  (str.++  "cacac" B "bbaccbbacbba") ))
(assert (= (str.++  "bcccbbaaacbbcc" B "aba")  (str.++  "bcccbbaaacbbccaabbbaba" "") ))
(assert (= (str.++  "baaabbbcbaacccbccbabcb" "")  (str.++  "ba" B "cbaacccbccbabcb") ))
(assert (= (str.++  "bbbabb" B "ccabacccbaa")  (str.++  "bbbabb" B "ccabacccbaa") ))
(assert (= (str.++  "bacbacbcbabaacaaabbbcc" "")  (str.++  "bacbacbcbabaaca" B "cc") ))
(assert (= (str.++  "aaaa" B "bcbcccbbabcaa")  (str.++  "aaaaaabbbbcbcccbbabcaa" "") ))
(assert (= (str.++  "bbababcac" B "caacbbac")  (str.++  "bbababcac" B "caacbbac") ))
(assert (= (str.++  "bcaaabcaabbbbbcacccabb" "")  (str.++  "bcaaabc" B "bbcacccabb") ))
(assert (= (str.++  "caacaaac" B "bcccaaaca")  (str.++  "caacaaacaabbbbcccaaaca" "") ))
(assert (= (str.++  "bbacabbcbabababcb" B)  (str.++  "bbacabbcbabababcbaabbb" "") ))
(assert (= (str.++  "ccacccbbaaccaabbbbcbab" "")  (str.++  "ccacccbbaacc" B "bcbab") ))
(assert (= (str.++  "aabbbbacaabcbccacbcbbc" "")  (str.++  B "bacaabcbccacbcbbc" "") ))
(check-sat)
(get-model)
