;; this is a simple game of tic-tac-toe
;; first graphical, then non-graphical

;; this is a stateful implementation
(defparameter *game-state* (make-array '(3 3) :initial-contents 
				       '(((nil) (nil) (nil))
					 ((nil) (nil) (nil))
					 ((nil) (nil) (nil)))
				       )
  "this is the game of tic-tac-toe"
  )

; access with (aref symbol x y
; remember, 0 is the base coord!

(defstruct player name mark)
; mark can be X or O

(defun mark-spot! (mark x y) ; make the Schemers feel at home
  "marks a square"
  (setf (aref x y) mark))
; make sure to decf x and y in the final release, so that we can have 1-3 instead of 0-2

(defun ticp (x y z)
  "tests if tic-tac-toe!"
  (and (eq x y) (eq y z)))

(defun column-tac (column)
  (ticp (aref *game-state* 0 column)
	(aref *game-state* 1 column)
	(aref *game-state* 2 column))
  )

(defun row-tac (row) 
  (ticp (aref *game-state* row 0)
	(aref *game-state* row 1)
	(aref *game-state* row 2))
  )

(defgeneric cross-tac (direction))

(defmethod cross-tac ((direction (eql :back)))
  (ticp (aref *game-state* 0 0)
	(aref *game-state* 1 1)
	(aref *game-state* 2 2))
    )

(defmethod cross-tac ((direction (eql :forward)))
  (ticp (aref *game-state* 0 2)
	(aref *game-state* 1 1)
	(aref *game-state* 2 0))
  )

#|
defun tac-search (mark)
  "searches for tac column"
  loop for i
       from 0
       do (ticp (aref *game-state* i 0))
|#
     
(defun winp ())

#|
defmacro eq3 (x y z)
  `(and (eq x y) (eq y z)))
|#

#|
loop for i
     from 0
     do (loop for i
	     from 0
	     do
	     until 2
     until 2
|#

(defun start (player1 mark &key player2 mark2)
  "starts the game"
  (make-player :name name :mark mark)
  ) ; should also clear the board and create a CPU player by default
;; oh, code a cpu player.

(defun game ()
  "a simple game of tic-tac-toe"
  )
