(defun xy/done ()
"Make Emacs frame invisible, just like the `emacs –daemon’"
  (interactive)
  (save-some-buffers) ;; Save edited buffers first!
  (kill-buffer)
  ;(server-edit)
  (if (sr-speedbar-exist-p)
      (sr-speedbar-close))
  (make-frame-invisible nil t))

(when (equal system-type 'windows-nt)
  (setq file-name-coding-system 'gbk);防止中文路径乱码
  (global-set-key (kbd "C-x C-c") 'xy/done) ;; virtually kill a frame
  (global-set-key (kbd "C-x M-c") 'save-buffers-kill-emacs)) ;; kill emacs
(when window-system
  (define-key special-event-map [delete-frame] 'xy/done))

(defun python-compile ()
  (interactive)
  (save-buffer)
  (compile (concat "python " (buffer-name (current-buffer)))))

(defun go-compile ()
  (interactive)
  (save-buffer)
  (compile (concat "go run " (buffer-name (current-buffer)))))

(add-hook 'python-mode-hook 
  (lambda ()
    (interactive)
    (local-set-key (kbd "<f5>") 'python-compile)))

(add-hook 'go-mode-hook
  (lambda ()
    (interactive)
    (local-set-key (kbd "<f5>") 'go-compile)))

;(add-hook 'kill-emacs-hook  ;;
;  (lambda() ;;
;    (if (file-exists-p "~/.emacs.d/server/server") ;;
;      (delete-file "~/.emacs.d/server/server")))) ;;

(defun keep-one-window ()
  (interactive)
  (if (get-buffer "*compilation*")
    (progn
      (delete-windows-on "*compilation*")
      (kill-buffer "*compilation*")))
  (evil-force-normal-state))

;(global-set-key (kbd "<escape>") 'keep-one-window)

;(define-key evil-normal-state-map '1' 'delete-other-windows)


(provide 'init-func)
