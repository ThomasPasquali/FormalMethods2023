(set-option :produce-models true)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)
(declare-const D Bool)

(assert (or (not B) (not C)))
(assert-soft A :weight 1 :id penalty)
(assert-soft B :weight 1 :id penalty)
(assert-soft C :weight 1 :id penalty)
(assert-soft D :weight 1 :id penalty)

(minimize penalty)

(check-sat)
(get-objectives)
(get-model)
(exit)