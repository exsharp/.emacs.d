;关闭frame时kill-buffer
(add-hook 'delete-frame-functions
          (lambda (frame)
            (let* ((window (frame-selected-window frame))
                   (buffer (and window (window-buffer window))))
              (when (and buffer (buffer-file-name buffer))
                (kill-buffer buffer)))))

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

(provide 'init-func)
