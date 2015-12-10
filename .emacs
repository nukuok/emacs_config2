(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Lucida Sans Typewriter" :foundry "outline" :slant normal :weight normal :height 83 :width normal))))
 '(cursor ((((class color) (background dark)) (:background "#00AA00")) (((class color) (background light)) (:background "#999999")) (t nil))))

;; Lisp処理系のコマンド
(add-to-list 'load-path "~/slime-2.13")
(add-to-list 'load-path "~/w3-4.0.49")
(add-to-list 'load-path "~/.emacs.d/lisp")
;(add-to-list 'load-path "~/.emacs.d/list/trivial-ssh")
;(add-to-list 'load-path "~/.emacs.d/lisp/wsd-mode-master")
;(add-to-list 'exec-path "d:/Program Files/Gow/bin")
(setenv "PATH" (concat  "D:\\Gow\\bin" ";" (getenv "PATH")))
(setenv "PATH" (concat  "D:\\Program Files\\Sipp_3.2" ";" (getenv "PATH")))
(setenv "PATH" (concat  "D:\\Program Files\\Git\\bin" ";" (getenv "PATH")))
;(setq exec-path (append (list dir) exec-path))

(setq inferior-lisp-program "~/ccl/wx86cl.exe")

(require 'slime)
(require 'slime-autoloads)
;(require 'asdf)
;(require 'trivial-ssh)


(require 'w3)
(require 'scenario)
(require 'default)
(require 'sr-speedbar)
;(require 'wsd-mode)
(setq sr-speedbar-right-side nil)
(setq w3-default-homepage "http://localhost/redmine")
(slime-setup '(slime-fancy))
(add-hook 'lisp-mode-hook (lambda ()
       (slime-mode t)
       (show-paren-mode)))

(defun split-window-and-run-shell()
  (setq w (selected-window))
  (setq w2 (split-window w nil t))
  (select-window w)
  (eshell)
  (select-window w2))

(add-hook 'after-init-hook (lambda () (split-window-and-run-shell)))
;;(add-hook 'after-init-hook (lambda () (sr-speedbar-open)))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
 ;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(org-export-with-sub-superscripts (quote {}))
 '(show-paren-mode t))


(setq url-proxy-services
	'(("http" . "kws.proxy.nic.fujitsu.com:8080")
	  ("https" . "kws.proxy.nic.fujitsu.com:8080")))
;(base64-encode-string "username:password")
(setq url-http-proxy-basic-auth-storage
	'(("kws.proxy.nic.fujitsu.com:8080" ("Proxy" . "aHVhbmcueWFuZ3lhbmdAanAuZnVqaXRzdS5jb206NjU3MDc4Nzc3Nw=="))))


;;;plantUML
(setq org-plantuml-jar-path "~/.emacs.d/plantuml.jar")
(defun org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list 'org-babel-load-languages '(plantuml . t))))
(add-hook 'org-mode-hook 'org-mode-init)

(global-linum-mode t)

(defun sso ()
  (interactive)
  (sr-speedbar-open))

(fset 'ev
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 114 32 122 18 100 101 102 117 110 32 1 0 134217734 134217848 101 118 97 108 45 114 101 103 105 111 110 return 24 114 106 122 6 2 6 2 0] 0 "%d")) arg)))

(fset 'evf
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 114 32 122 18 100 101 102 117 110 1 0 134217734 134217848 101 118 97 108 45 114 101 103 105 111 110 13 134217848 105 110 100 101 110 116 45 114 101 103 105 111 110 13 24 114 106 122 7] 0 "%d")) arg)))

(fset 'ev_bkp
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 114 32 122 18 100 101 102 117 110 32 1 0 134217734 134217848 101 118 97 108 45 114 101 103 105 111 110 return 24 114 106 122 6 2 6 2 0] 0 "%d")) arg)))

(fset 'ret
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([return] 0 "%d")) arg)))

(fset 'telecom
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([116 101 108 101 99 111 109 return] 0 "%d")) arg)))

(fset 'orgtext
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([35 43 66 69 71 73 78 95 83 82 67 32 116 101 120 116 return return 35 43 42 backspace 69 78 68 95 83 82 67 16] 0 "%d")) arg)))

;(defun test ()
;  (interactive)
;  (insert (read-char)))

(defun test2 ()
  (interactive)
  (let (num)
    (setq num (buffer-substring (region-beginning) (region-end)))
    (insert (int-to-string (- (string-to-int num) 1)))))

(fset 'cp-command
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([11 99 112 32 45 114 32 25 32 25 18 46 6 46 47 66 45 78 5 18 45 18 0 2 134217848 116 101 115 116 50 13 4 19 78 66 2 20 14 1] 0 "%d")) arg)))

(defun cron ()
  (interactive)
  (shell-command "mv c:\\Users\\Owner\\Desktop\\org-mode-file\\org\\*html c:\\Users\\Owner\\Desktop\\org-mode-file\\html")
  (shell-command "mv c:\\Users\\Owner\\Desktop\\org-mode-file\\org\\*png c:\\Users\\Owner\\Desktop\\org-mode-file\\html"))

(put 'upcase-region 'disabled nil)

