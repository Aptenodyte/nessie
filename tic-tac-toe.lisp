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

(defun mark! (mark x y) ; make the Schemers feel at home
  "marks a square"
  (setf (aref *game-state* x y) mark))
; make sure to decf x and y in the final release, so that we can have 1-3 instead of 0-2

(defun mark-matchp (mark square)
  "tests if mark matches"
  (eql mark square))

(defun tic (mark x y z)
  "does a series of three marks match?"
  (if (eq t (and (mark-matchp mark x) 
		 (mark-matchp mark y)
		 (mark-matchp mark z)))
      mark ; should use labels / let
      'nil ; the if approach isn't working for uncear reasons
      )) ; I hate making a core function bigger than a few lines, though.

(defgeneric tac (direction mark))

(defmethod tac ((direction (eql :back)) mark)
  (tic mark
       (aref *game-state* 0 0)
       (aref *game-state* 1 1)
       (aref *game-state* 2 2)))

(defmethod tac ((direction (eql :forward)) mark)
  (tic mark
       (aref *game-state* 0 2)
       (aref *game-state* 1 1)
       (aref *game-state* 2 0)))

(defun column-tac (mark column)
  "checks to see if there is a win in a column"
  (tic mark
       (aref *game-state* 0 column)
       (aref *game-state* 1 column)
       (aref *game-state* 2 column)))

(defun row-tac (mark row)
  "checks to see if there is a win in a row"
  (tic mark
       (aref *game-state* row 0)
       (aref *game-state* row 1)
       (aref *game-state* row 2)))


#|
defun tac-search (mark)
  "searches for tac column"
  loop for i
       from 0
       do (ticp (aref *game-state* i 0))
|#
     
(defun winp ())

(defun start (player1 mark &key player2 mark2)
  "starts the game"
  (make-player :name player1 :mark mark)
  ) ; should also clear the board and create a CPU player by default
;; oh, code a cpu player.

(defun game ()
  "a simple game of tic-tac-toe"
  )
