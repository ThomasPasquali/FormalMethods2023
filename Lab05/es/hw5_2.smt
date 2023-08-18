; Options

(set-option :produce-models true)

; Declarations

(declare-const x Int)
(declare-const y Int)

(define-fun obj () Int (* x (* y y)))

; Assertions

(assert (>= 0 x))
(assert (>= 0 y))
(assert (= 9 (+ x y)))
(assert (and (> 0 obj) (< 200 obj)))


; Objectives

(maximize obj :id objective)


; Actions
(check-sat)
(get-objectives)
(get-model)
(exit)