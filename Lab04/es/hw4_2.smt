(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)

(assert (and (>= A 1) (<= A 5)))
(assert (and (>= B 1) (<= B 5)))
(assert (and (>= C 1) (<= C 5)))
(assert (and (>= D 1) (<= D 5)))
(assert (and (>= E 1) (<= E 5)))

(assert (distinct A B C D E))

(assert (> A D))
(assert (and (> B C) (> B E)))
(assert (or (> E B) (> E D)))
(assert (> C A))

(check-sat)
(get-model)
(exit)