;   o---o---o---o
;   | A | B | C |
;   o---o---o---o

; ENCODING

; variables XN
; X (letter) -> position [ABC]
; N (number) -> value in cell
(declare-const A1 Bool)
(declare-const B1 Bool)
(declare-const C1 Bool)
(declare-const A2 Bool)
(declare-const B2 Bool)
(declare-const C2 Bool)
(declare-const A3 Bool)
(declare-const B3 Bool)
(declare-const C3 Bool)
(declare-const A4 Bool)
(declare-const B4 Bool)
(declare-const C4 Bool)

; Contraints
(assert (or C2 C4)) ; The password should be even
; We cannon use the same digit three times
(assert (not (and A1 B1 C1)))
(assert (not (and A2 B2 C2)))
(assert (not (and A3 B3 C3)))
(assert (not (and A4 B4 C4)))
; It is possible to repeat the same digit twice, just make sure the two digits are not adjacent.
(assert (not (and A1 B1)))
(assert (not (and B1 C1)))
(assert (not (and A2 B2)))
(assert (not (and B2 C2)))
(assert (not (and A3 B3)))
(assert (not (and B3 C3)))
(assert (not (and A4 B4)))
(assert (not (and B4 C4)))

; Hidden
; Exaclty one value for slot
(assert (or A1 A2 A3 A4))
(assert (=> A1 (and (not A2) (not A3) (not A4))))
(assert (=> A2 (and (not A1) (not A3) (not A4))))
(assert (=> A3 (and (not A2) (not A1) (not A4))))
(assert (=> A4 (and (not A2) (not A3) (not A1))))
(assert (or B1 B2 B3 B4))
(assert (=> B1 (and (not B2) (not B3) (not B4))))
(assert (=> B2 (and (not B1) (not B3) (not B4))))
(assert (=> B3 (and (not B2) (not B1) (not B4))))
(assert (=> B4 (and (not B2) (not B3) (not B1))))
(assert (or C1 C2 C3 C4))
(assert (=> C1 (and (not C2) (not C3) (not C4))))
(assert (=> C2 (and (not C1) (not C3) (not C4))))
(assert (=> C3 (and (not C2) (not C1) (not C4))))
(assert (=> C4 (and (not C2) (not C3) (not C1))))

; Unique
; (assert (not (and A3 B4 C2)))
; (assert (not (and A4 B3 C2)))
; (assert (not (and A2 B3 C2)))
; many more...

(check-sat)
(get-model)
(exit)
