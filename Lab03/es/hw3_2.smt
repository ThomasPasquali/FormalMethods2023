(set-option :produce-models true)

(declare-const diamond Int)
(declare-const square Int)
(declare-const half_square Int)
(declare-const pentagon Int)
(declare-const rectangle Int)
(declare-const circle Int)
(declare-const sol Int)

(assert (> diamond 0))
(assert (> half_square 0))
(assert (> circle 0))
(assert (> pentagon 0))
(assert (> rectangle 0))

(assert (not (= diamond square)))
(assert (not (= diamond pentagon)))
(assert (not (= diamond rectangle)))
(assert (not (= diamond circle)))
(assert (not (= square pentagon)))
(assert (not (= square rectangle)))
(assert (not (= square circle)))
(assert (not (= pentagon rectangle)))
(assert (not (= pentagon circle)))
(assert (not (= rectangle circle)))

; (assert (= sol (+ square (* 2 diamond)))) ; Sol a SAT
; (assert (= sol (+ square diamond))) ; Sol b UNSAT
(assert (= sol (+ square half_square))) ; Sol c SAT
; (assert (= sol (+ pentagon diamond))) ; Sol d SAT

(assert (= half_square (/ square 2)))

(assert (= (+ diamond square circle) (+ pentagon (* 2 rectangle))))
(assert (= (+ square pentagon) (+ circle diamond square)))
(assert (= (* 3 rectangle) sol))

(check-sat)
(get-model)
(exit)