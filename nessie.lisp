;;;; nessie.lisp

(in-package #:nessie)

;;; "nessie" goes here. Hacks and glory await!

(defparameter *window-size* '(256 . 240)
  "x, y pixel size of the game window"
  )

(defparameter *window-name* "Look, Ma, a window!")

(sdl:with-init ()
  (sdl:window (car *window-size*) (cdr *window-size*) :title-caption *window-name*)
  (setf (sdl:frame-rate) 8)

  (sdl:with-events ()
    (:quit-event () t)
    (:key-down-event ()
		     (sdl:push-quit-event))
    (:idle ()
	   (sdl:clear-display sdl:*black*)
	   (sdl:update-display))))