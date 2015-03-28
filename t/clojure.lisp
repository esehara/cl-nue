(in-package :cl-user)
(defpackage nue-test
  (:use :cl
        :nue
        :prove
        :nue.clojure))
(in-package :nue-test)

(plan 2)

;; conj
(is (conj '(a b c) 'd) '(d a b c))
(is (conj '(a b c) 'd 'e) '(e d a b c))
(finalize)
