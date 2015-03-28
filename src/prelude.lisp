(in-package :cl-user)
(defpackage nue.prelude
  (:use :cl)
  (:import-from :nue))
(in-package :nue.prelude)
(cl-annot:enable-annot-syntax)

; Import from Haskell Prelude (4.7.0.2)
; http://hackage.haskell.org/package/base-4.7.0.2/docs/Prelude.html

@export
(defun take (n lst)
  (cond ((<= n 0) nil)
        ((not lst) nil)
        (t (cons (car lst) (take (- n 1) (cdr lst))))))

@export
(defun drop (n lst)
  (cond ((<= n 0) lst)
        ((not lst) nil)
        (t (drop (- n 1) (cdr lst)))))

@export
(defun take-while (lmd lst)
  (cond ((not lst) nil)
        (t (let ((x (car lst)) (xs (cdr lst)))
             (if (funcall lmd x)
                 (cons x (take-while lmd xs)) nil)))))

@export
(defun drop-while (lmd lst)
  (cond ((not lst) nil)
        (t (if (funcall lmd (car lst))
            (drop-while lmd (cdr lst)) lst))))

@export
(defun iterate-h (n lmd lst)
  (let* ((lst-for-loop lst)
         (iterate-result
               (loop for i from 1 to (- n 1)
                  do (setq lst-for-loop (funcall lmd lst-for-loop))
                  append lst-for-loop)))
            (append lst iterate-result)))

@export
(defun list-array (range lst)
  (let ((l (car range))
        (u (cadr range))
        (pair-lst lst))
    (loop for i from l to u
       when lst
       collect (list i (car pair-lst))
       do (setf pair-lst (cdr pair-lst)))))

@export
(defun find-from-list-array (lst index)
  (car (loop for i in lst
       when (= (car i) index)
       collect (cadr i))))
