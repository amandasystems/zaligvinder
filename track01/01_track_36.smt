(set-logic QF_S)
(declare-fun D () String)
(declare-fun G () String)
(declare-fun A () String)
(declare-fun J () String)
(assert (= (str.++  "aeca" D "acdffebcdcbdddfabcecfaacaeebabca" D "de" A "afcaddfbcaecbbcfeadddacdbceca")  (str.++  "aeca" D "acdffe" J "acaeebabca" D "defdbdaeeafe" G "ddfbcaecbbcfeadddacdbceca") ))
(check-sat)
(get-model)
