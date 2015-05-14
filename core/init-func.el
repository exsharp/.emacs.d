(defun xy/done ()
"Make Emacs frame invisible, just like the `emacs –daemon’"
  (interactive)
  (save-some-buffers) ;; Save edited buffers first!
  (kill-buffer)
  (server-edit)
  (make-frame-invisible nil t))

(when (equal system-type 'windows-nt)
  (global-set-key (kbd "C-x C-c") 'xy/done) ;; virtually kill a frame
  (global-set-key (kbd "C-x M-c") 'save-buffers-kill-emacs)) ;; kill emacs
(when window-system
  (define-key special-event-map [delete-frame] 'xy/done))

;(add-hook 'after-init-hook '(lambda () (xy/done)));;开启程序即启用

(provide 'init-func)