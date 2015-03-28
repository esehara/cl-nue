(in-package :cl-user)
(defpackage nue-test
  (:use :cl
        :prove
        :nue.prelude))
(in-package :nue-test)
(plan 5)

;; take
(is (take 2 '(1 2 3)) '(1 2))

;; drop
(is (drop 2 '(1 2 3)) '(3))

;; takeWhile
(is (take-while (lambda (x) (> x 10)) '(11 12 13 1 2 3 14))
    '(11 12 13))

;; dropWhile
(is (drop-while (lambda (x) (> x 10)) '(11 12 13 1 2 3 14))
    '(1 2 3 14))

;;iterate-n
(is (iterate-h 4 (lambda (x) (reverse x)) '(1 2))
    '(1 2 2 1 1 2 2 1))

(finalize)
