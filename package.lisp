(defpackage #:com.aragaer.pa-brain
  (:use #:common-lisp)
  (:export :main
	   :thought
	   :add-thought
	   :try-handle
	   :make-event
	   :add-default-thought
	   :load-state
	   :save-state
	   :react
	   :process
	   :greeter
	   :japanese-reminder
	   :dont-understand
	   :scheduled-reminder
	   :dialog
	   :finished-p
	   :mark-finished))
