(in-package :cl-user)
(defpackage nue.clojure
  (:use :cl))
(in-package :nue.clojure)
(cl-annot:enable-annot-syntax)

@export
(defun conj (seq &rest xs)
  (append
   (loop for x in (reverse xs) collect x) seq))
