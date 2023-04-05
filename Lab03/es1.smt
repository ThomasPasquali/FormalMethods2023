(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)

(assert (= d (+ a c)))
(assert (= c (* a b)))
(assert (= b (- c b)))
(assert (= d (* a 4)))

(assert (< a 10))
(assert (< b 10))
(assert (< c 10))
(assert (< d 10))
(assert (>= a 0))
(assert (>= b 0))
(assert (>= c 0))
(assert (>= d 0))

(assert (distinct a b c d))

;(assert (not (and (= a 2) (= b 3) (= c 6) (= d 8))))

(check-sat)
(get-value (a b c d))
(exit)