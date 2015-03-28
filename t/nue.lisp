(in-package :cl-user)
(defpackage nue-test
  (:use :cl
        :nue
        :prove))
(in-package :nue-test)

;; NOTE: To run this test file, execute `(asdf:test-system :nue)' in your Lisp.

(plan 1)

;;simple-flatten
(is (simple-flatten '((1 2) 3 (4 5))) '(1 2 3 4 5))

(finalize)
