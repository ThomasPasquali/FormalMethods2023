(declare-const A1 Bool) ; A sits on seat 1
(declare-const A2 Bool)
(declare-const A3 Bool)
(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(declare-const C1 Bool)
(declare-const C2 Bool)
(declare-const C3 Bool)

; Contraints
; A does not want to sit next to C.
(assert (and (not (and A1 C2)) (not (and A2 C3)) (not (and A3 C2)) (not (and A2 C1))))
; A does not want to sit on the leftmost chair.
(assert (not A1))
; B does not want to sit at the right of C
(assert (and (not (and C1 B2)) (not (and C2 B3))))

; Hidden
; Each takes exactly one seat
(assert (or A1 A2 A3))
(assert (=> A1 (and (not A2) (not A3))))
(assert (=> A2 (and (not A1) (not A3))))
(assert (=> A3 (and (not A2) (not A1))))

(assert (or B1 B2 B3))
(assert (=> B1 (and (not B2) (not B3))))
(assert (=> B2 (and (not B1) (not B3))))
(assert (=> B3 (and (not B2) (not B1))))

(assert (or C1 C2 C3))
(assert (=> C1 (and (not C2) (not C3))))
(assert (=> C2 (and (not C1) (not C3))))
(assert (=> C3 (and (not C2) (not C1))))

; Do not have duplicate seats
(assert (or A1 B1 C1))
(assert (=> A1 (and (not B1) (not C1))))
(assert (=> B1 (and (not C1) (not A1))))
(assert (=> C1 (and (not A1) (not B1))))

(assert (or A2 B2 C2))
(assert (=> A2 (and (not B2) (not C2))))
(assert (=> B2 (and (not C2) (not A2))))
(assert (=> C2 (and (not A2) (not B2))))

(assert (or A3 B3 C3))
(assert (=> A3 (and (not B3) (not C3))))
(assert (=> B3 (and (not C3) (not A3))))
(assert (=> C3 (and (not A3) (not B3))))

(check-sat)
(get-model)
(exit)