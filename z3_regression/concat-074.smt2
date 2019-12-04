(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)
(declare-const m String)
(declare-const k String)
(declare-const n1 String)
(declare-const n2 String)

(assert (= z (str.++ x "gkhi" ) ) )
(assert (= z (str.++ y "hi"   ) ) )
(assert (= z (str.++ "abcd" m ) ) )
(assert (= z (str.++ "ab" k ) ) )
(assert (= z (str.++ n1 n2 ) ) )

(check-sat)
(get-model)