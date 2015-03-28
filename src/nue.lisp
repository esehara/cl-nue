(in-package :cl-user)
(defpackage nue
  (:use :cl)
  (:import-from :nue.prelude)
  (:import-from :nue.clojure)
  (:import-from :nue.racket
                :list?))
(in-package :nue)
(cl-annot:enable-annot-syntax)

@export
(defun simple-flatten (lst)
  (apply (lambda (&rest lists)
           (reduce (lambda (x y)
                     (let ((append-y (if (list? y) y (list y))))
                       (append x append-y)))
                   lists)) lst))
