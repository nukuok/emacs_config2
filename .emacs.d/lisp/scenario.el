(defun start-scenario ()
  (interactive)
  (insert "<?xml version=\"1.0\" encoding=\"ISO-8859-1\" ?>")
  (newline)
  (insert "<!DOCTYPE scenario SYSTEM \"sipp.dtd\">")
  (newline)
  (newline)
  (insert "<scenario name=\"\">")
  (newline)
  (newline)
  (newline)
  (insert "</scenario>"))

(defun* scenario-send (&optional (num 1) (indent-num 7))
  (interactive "p")
  (insert "  <send>")
  (newline)	     
  (insert "    <![CDATA[")
  (newline)
  (newline)
  (dotimes (x num)
    (indent indent-num)
    (forward-line))
  (insert "    ]]>")
  (newline)
  (insert "  </send>")
  (newline))

(defun scenario-receive ()
  (interactive)
  (insert "  <recv response=\"\" >")
  (newline)
  (remove-until-empty-line)
  (insert "  </recv>")
  (newline)
  (search-backward "\""))


(provide 'scenario)


;;;(setq url "m=audio [SBCのポート番号] RTP/AVP 0")
;;;(string-match "([^\[]*)\\[(.*)\\](.*)" url)
;;;(message (match-string 1 url))
;;;(message (match-string 2 url))
;;;(message (match-string 3 url))

;;;(setq url "https://www.google.co.jp/")
;;;(string-match "https:\\/\\/\\(.*\\)\\/" url)
;;;(message (match-string 1 url))

;;;(message "123")

(defun extract-parenthesis ()
  (interactive)
  (generate-new-buffer "temp-buffer")
  (let (start end)
    (loop
     (setq end (re-search-forward "\\[.*\\]"))
     (set-mark (point))
     (search-backward "[")
     (setq start (point))
     (append-to-buffer "temp-buffer" start end)
     (forward-char))))

(defun remove-in-a-parenthesis ()
  (interactive)
  (let (start end) 
    (setq end (re-search-forward "\\]\\|)"))
    (setq start (re-search-backward "\\[\\|("))
    (kill-region start end)))

(defun scenario-last ()
  (interactive)
  (move-beginning-of-line 1)
  (forward-word 1)
  (backward-word 1)
  (insert "[last_")
  (search-forward ":")
  (kill-line)
  (insert "]"))

(defun scenario-next-message ()
  (interactive)
  (re-search-forward "<send\\|<recv")
  (move-beginning-of-line 1))

(defun scenario-cut-message ()
  (interactive)
  (move-end-of-line 1)
  (re-search-backward "<send\\|<recv")
  (move-beginning-of-line 1)
  (set-mark (point))
  (re-search-forward "</send>\\|</recv>")
  (kill-region 0 0 1)
  (scenario-next-message))
