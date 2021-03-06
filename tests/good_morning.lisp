(in-package :cl-user)

(load #P"brain.lisp")

(defpackage good-morning-test
  (:use :cl
        :prove
        :com.aragaer.pa-brain))

(in-package #:good-morning-test)
(plan nil)

(let* ((from '((:user . "user") (:channel . "channel")))
       (side-channel '((:user . "user") (:channel . "incoming")))
       (to '((:user . "niege") (:channel . "brain")))
       (presence `((:event . "presence") (:from . ,from) (:to . ,to)))
       (event `((:event . "new-day") (:to . ,to) (:from . ,from)))
       (result nil)
       (msg nil))

  (subtest "with active channel"
	   (set-user "user")
	   (setf result (handle-message presence))
	   (is result nil)
	   (setf result (handle-message event))
	   (setf msg (car result))
	   (is (assoc :message msg) (cons :message "good morning"))
	   (is (assoc :from msg) (cons :from to))
	   (is (assoc :to msg) (cons :to from)))

  (subtest "without active channel"
	   (set-user "user")
	   (setf result (handle-message event))
	   (is result nil)
	   (setf result (handle-message presence))
	   (setf msg (car result))
	   (is (assoc :message msg) (cons :message "good morning"))
	   (is (assoc :from msg) (cons :from to))
	   (is (assoc :to msg) (cons :to from))))

(finalize)
