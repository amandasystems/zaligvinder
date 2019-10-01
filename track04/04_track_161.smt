(set-logic QF_S)
(declare-fun B () String)
(declare-fun G () String)
(declare-fun A () String)
(declare-fun D () String)
(assert (= (str.++  "ddeddabdeccbdedaedaadadcecaacdcdebdddedada" G "ceecceebaebaaedcaacadbabbdbdb")  (str.++  "ddeddabdeccbdedae" D "dbdb") ))
(assert (= (str.++  "ebbdaebaacbdcedcdd" D "bbbcebacbbcadee" G "cdddccbdca")  (str.++  "ebbdaebaacb" B "dcd" B "cecbdbbbcebac" A "bebdbdabacdeddcacdaadbebdbbeeedaededcdddccbdca") ))
(assert (= (str.++  "bbddd" B "ebddecbaceadcccdeabdbdcbdcadaecddcbecbbecaaebcacaddecbadddccdebdbcccacadeceaadeedbacdbaddba")  (str.++  "bbddddceebddecbaceadcccdeabdbdcbdcadaecddcbecbbecaaebcacaddecbadddccdebdbcccacadeceaadeedbacdbaddba" "") ))
(assert (= (str.++  "dbcbeabbbadeaaaeddaaeddcabbbcedaebaadbddeaacaabaeddbacdbaabbbcceecdeabaebcedbaeccceeacccaadbbac" B "a")  (str.++  "dbcbeabbbadeaaaeddaaeddcabbbcedaebaadbddeaacaabaeddbacdbaabbbcceecdeabaebcedbaeccceeacccaadbbacdcea" "") ))
(assert (= (str.++  "ccbeedbdbcacccdebadbddbedbdeeebdabeeaacaacaccedacccae" B "ccdceeabddaececdbcedecadeebdcbbddecaccacdaa")  (str.++  "ccbeedbdbcacccdebadbddbedbdeeebdabeeaacaacaccedacccaedcecc" B "eabddaececdbcedecadeebdcbbddecaccacdaa") ))
(assert (= (str.++  "bcdddeeacabcbdacdbbeddadbecccabdbbdda" B "cdcddcdbbcbaabccaacdbcecaeeaccaaeccbbadbcaccadbcecaaaacdbec")  (str.++  "bcdddeeacabcbdacdbbeddadbecccabdbbdda" B "cdcddcdbbcbaabccaacdbcecaeeaccaaeccbbadbcaccadbcecaaaacdbec") ))
(assert (= (str.++  "cdecdeccbcddaceeedecbaadebaacddeecbeec" B "baeaedabddbbeeaaebbcbccbdabaaaabbadaceebeadcbdeecbebde" B "e")  (str.++  "cdecdeccbcddaceeedecbaadebaacddeecbeec" B "baeaedabddbbeeaaebbcbccbdabaaaabbadaceebeadcbdeecbebde" B "e") ))
(assert (= (str.++  "abedbbcecbcecabbacaadebcbabaeeccd" B "cbededdecaccbedacacbdbba" B "b" B "eeabbbdacdecedcdbcbdceeabeecbcad")  (str.++  "abedbbcecbcecabbacaadebcbabaeeccddcecbededdecaccbedacacbdbba" B "bdceeeabbbdacdecedcdbcb" B "eabeecbcad") ))
(assert (= (str.++  "daeceacdddddbbbeaadbcbcaaaccddaecbbbdeecdaca" B "acbdccbcabcbdadebdabeddade" B "ddccedeaeaddbcdbcdaeaae")  (str.++  "daeceacdddddbbbeaadbcbcaaaccddaecbbbdeecdaca" B "acbdccbcabcbdadebdabeddadedceddccedeaeaddbcdbcdaeaae") ))
(assert (= (str.++  "caadaebcdddaac" B "eedbccdccaeeeebdecbbebceeabadcbebabdccdacccdeabdebbdbddeebeedddcaddadedaaddbeaacaa")  (str.++  "caadaebcdddaacdceeedbccdccaeeeebdecbbebceeabadcbebabdccdacccdeabdebbdbddeebeedddcaddadedaaddbeaacaa" "") ))
(assert (= (str.++  "acccbbaaeececacecaadcbeeadcbdbbdeaebabcbeaedcdabccadded" B "cacaaecdebedbbaedbdbcbdcaeeabababadbcadbd")  (str.++  "acccbbaaeececacecaadcbeeadcbdbbdeaebabcbeaedcdabccaddeddcecacaaecdebedbbaedbdbcbdcaeeabababadbcadbd" "") ))
(assert (= (str.++  "cbcacccbcdaaddeabdbccaeceacaacbccbdbdbcabcddbcecaeeebab" B "acbbaebacddccdabbdaaacebaaceccccadcaebcec")  (str.++  "cbcacccbcdaaddeabdbccaeceacaacbccbdbdbcabcddbcecaeeebabdceacbbaebacddccdabbdaaacebaaceccccadcaebcec" "") ))
(assert (= (str.++  "dddaadccaeddeeaabb" B "acbebbddcbcbeeaabbeeebcabdaeaadaddecdcacaadbdecacaabbadcaedcacaedaaddcdaabeeba")  (str.++  "dddaadccaeddeeaabb" B "acbebbddcbcbeeaabbeeebcabdaeaadaddecdcacaadbdecacaabbadcaedcacaedaaddcdaabeeba") ))
(check-sat)
(get-model)
