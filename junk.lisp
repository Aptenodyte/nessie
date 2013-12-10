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

#|
defun tac-search (mark)
  "searches for tac column"
  loop for i
       from 0
       do (ticp (aref *game-state* i 0))
|#