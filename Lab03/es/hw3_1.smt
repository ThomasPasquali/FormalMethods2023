(set-option :produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)

(define-fun abc ((a Int) (b Int) (c Int)) Int (+ a (* b 10) (* c 100)))
(define-fun div4 ((c Int)) Bool (= 0 (mod c 4)))

(assert (and (> A 0) (<= A 9)))
(assert (and (>= B 0) (<= B 9)))
(assert (and (> C 0) (<= B 9)))

(assert (div4 (abc A B C)))
(assert (div4 (abc C B A)))

(check-allsat ())
; (get-model)
(exit)