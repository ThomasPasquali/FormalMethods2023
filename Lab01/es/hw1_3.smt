(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; Contraints
(assert (and B (not C)))
(assert (=> A C))
(assert (and (not C) (or A B)))

; Hidden
(assert (or A B C))

; Unique
; (assert (not (and (not A) B (not C))))

(check-sat)
(get-model)
(exit)
