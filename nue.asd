#|
  This file is a part of nue project.
  Copyright (c) 2015 Esehara Shigeo (esehara@gmail.com)
|#

#|
  Author: Esehara Shigeo (esehara@gmail.com)
|#

(in-package :cl-user)
(defpackage nue-asd
  (:use :cl :asdf))
(in-package :nue-asd)

(defsystem nue
  :version "0.0.1"
  :author "Esehara Shigeo"
  :license "WTFPL"
  :depends-on (:cl-annot)
  :components ((:module "src"
                :components
                ((:file "racket")
                 (:file "clojure")
                 (:file "prelude")
                 (:file "nue"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op nue-test))))
