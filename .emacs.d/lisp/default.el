(defun insert-space (num)
  ;;(interactive "nNumber of space to insert:")
  (let ((n num))
	(while (> n 0)
	  (insert " ")
	  (setq n (- n 1)))))
  
;;;(defun count-words-in-a-line ()
;;;  (interactive "n")
;;;  (count-words (line-beginning-position nil) (line-end-position nil)))

(defun count-words-in-a-line ()
  (- (line-end-position) (line-beginning-position)))

(defun* indent (&optional (number 7))
  (interactive "p")
  (while (> (count-words-in-a-line) 0)
    (beginning-of-line)
    (insert-space number)
    (forward-line)))

(defun remove-until-empty-line ()
  (interactive)
  (while (> (count-words-in-a-line) 0)
    (beginning-of-line)
    (kill-line)
    (kill-line)))

(defun remove-empty-lines ()
  (interactive)
  (while (= (count-words-in-a-line) 0)
    (beginning-of-line)
    (kill-line)
    (kill-line))
  (newline))

(provide 'default)


