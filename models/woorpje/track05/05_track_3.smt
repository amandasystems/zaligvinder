(set-logic QF_S)
(declare-fun F () String)
(declare-fun E () String)
(assert (= (str.++  "aacfcbebeabbeec" F "bfceaccdeaeddbeefacddaa")  (str.++  "aacfcbebeabbeecbbb" E "daa") ))
(assert (= (str.++  "ecffdbaddfbbbffaaf" F "eddfebaadaacafeabcae")  (str.++  "ecffdbaddfbbbffaafbbeddfebaadaacafeabcae" "") ))
(assert (= (str.++  "fdbcacfa" F "dfcddbefafedefcffeebfecdecdbfd")  (str.++  "fdbcacfa" F "dfcddbefafedefcffeebfecdecdbfd") ))
(check-sat)
(get-model)