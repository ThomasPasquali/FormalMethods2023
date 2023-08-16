; Common
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; Circ. 1
(declare-const X1 Bool)
(declare-const X2 Bool)
(declare-const X3 Bool)
(declare-const X4 Bool)
(declare-const O1 Bool)

; Circ. 2
(declare-const Y1 Bool)
(declare-const O2 Bool)

; Encoding circ. 1
(assert (= X1 (and A B)))
(assert (= X2 (or B C)))
(assert (= X3 (and B C)))
(assert (= X4 (and X2 X3)))
(assert (= O1 (or X1 X4)))

; Encoding circ. 2
(assert (= Y1 (or A C)))
(assert (= O2 (and Y1 B)))

; Check equiv
(assert (not (= O1 O2)))

(check-sat)
(exit)