#|
  This file is a part of nue project.
  Copyright (c) 2015 Esehara Shigeo (esehara@gmail.com)
|#

(in-package :cl-user)
(defpackage nue-test-asd
  (:use :cl :asdf))
(in-package :nue-test-asd)

(defsystem nue-test
  :author "Esehara Shigeo"
  :license "WTFPL"
  :depends-on (:nue
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "nue")
                 (:test-file "prelude")
                 (:test-file "racket")
                 (:test-file "clojure"))))

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
