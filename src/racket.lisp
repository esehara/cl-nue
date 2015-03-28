(in-package :cl-user)
(defpackage nue.racket
  (:use :cl))
(in-package :nue.racket)
(cl-annot:enable-annot-syntax)

@export
(defun integer? (int) (typep int 'integer))

@export
(defun zero? (num) (and (integer? num) (= num 0)))

@export
(defun string? (str) (typep str 'string))

@export
(defun list? (lst) (typep lst 'list))

@export
(defun string->list (str)
  (if (string? str) (coerce str 'list) nil))

@export
(defun list->string (lst)
  (if (list? lst) (coerce lst 'string) nil))
