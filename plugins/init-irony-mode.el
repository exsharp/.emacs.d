(require-package 'irony)
;; cmake -DLIBCLANG_LIBRARY="c:\\LLVM\\lib\\libclang.lib" -DLIBCLANG_INCLUDE_DIR="c:\\clang\\include\\" ~/.emacs.d/elpa/irony/server
;; 生成server文件放在.emacs.d/irony/bin
(require 'irony)

(load-file "~/.emacs.d/plugins/init-ac-irony.el")
(require 'ac-irony)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;replace the `completion-at-point' and `complete-symbol' bindings in
;irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(defun my-ac-irony-setup ()
  ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
  ;; *may* persist after an expansion.
  (add-to-list 'ac-sources 'ac-source-irony)
  (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async))

(add-hook 'irony-mode-hook 'my-ac-irony-setup)

(defun irony:complete-on-dot (nchars)
  "Insert dot and complete code at point"
  (interactive "p")
  (self-insert-command nchars)
  (unless (or (/= nchars 1)
              (ac-cursor-on-diable-face-p)
              (looking-back "\\(\\`\\|[^._[:alnum:]]\\)[0-9]+\\."))
    (ac-complete-irony-async)))

(add-hook 'irony-mode-hook (lambda ()
	(define-key irony-mode-map "." 'irony:complete-on-dot)
  (define-key irony-mode-map ":" 'irony:complete-on-dot)
  (define-key irony-mode-map ">" 'irony:complete-on-dot)))

;; window require
(when (eq system-type 'windows-nt)
  (setq w32-pipe-read-delay 0))

(provide 'init-irony-mode)
