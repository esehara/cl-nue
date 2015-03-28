(in-package :cl-user)
(defpackage nue-test
  (:use :cl
        :prove
        :nue.racket))
(in-package :nue-test)
(plan 13)

;; string?
(is (string? "foobar") t)
(is (string? '(1 2 3)) nil)

;; list?
(is (list? '(1 2 3)) t)
(is (list? "foobar") nil)

;; integer?
(is (integer? 1) t)
(is (integer? "foobar") nil)

;; zero?
(is (zero? 0) t)
(is (zero? 1) nil)
(is (zero? "foobar") nil)

;; string->list
(is (string->list "foobar") '(#\f #\o #\o #\b #\a #\r))
(is (string->list '(1 2 3)) nil)

;; list->string
(is (list->string '(#\f #\o #\o #\b #\a #\r)) "foobar")
(is (list->string "foobar") nil)

(finalize)
