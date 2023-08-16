(declare-const A1 Bool)
(declare-const B1 Bool)
(declare-const A2 Bool)
(declare-const B2 Bool)
(declare-const A3 Bool)
(declare-const B3 Bool)
(declare-const A4 Bool)
(declare-const B4 Bool)

; Hints
(assert (or A1 B2))
(assert (and (not A1) (not B4)))
(assert (or B4 A3))

; Hidden
(assert (or A1 A2 A3 A4))
(assert (or B1 B2 B3 B4))

(assert (=> A1 (and (not A2) (not A3) (not A4))))
(assert (=> A2 (and (not A1) (not A3) (not A4))))
(assert (=> A3 (and (not A2) (not A1) (not A4))))
(assert (=> A4 (and (not A2) (not A3) (not A1))))

(assert (=> B1 (and (not B2) (not B3) (not B4))))
(assert (=> B2 (and (not B1) (not B3) (not B4))))
(assert (=> B3 (and (not B2) (not B1) (not B4))))
(assert (=> B4 (and (not B2) (not B3) (not B1))))

; Is unique
; (assert (not (and A3 B2)))

(check-sat)
(get-model)
(exit)