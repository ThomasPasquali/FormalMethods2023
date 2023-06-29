(set-option :produce-models true)

(declare-const new_trees Int)
(define-fun tot_trees () Int (+ 50 new_trees))
(define-fun apples_per_tree () Int (- 800 (* 10 new_trees)))

(maximize (* tot_trees apples_per_tree) :id cost)

(check-sat)
(get-objectives)
(get-model)
(exit)