(load "package.lisp")
(require :uiop)

(in-package #:com.aragaer.pa-brain)
(load "commands.lisp")

(defun scheduled-reminder (arg)
  (format nil "cron ~a" arg))

(add-top-level-command "cron" 'scheduled-reminder)
