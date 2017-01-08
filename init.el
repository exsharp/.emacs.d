;; configure the position of saving.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar lisp-dir (expand-file-name "lisp" user-emacs-directory)"The root dir of lisp")
(defvar elpa-dir (expand-file-name "elpa" user-emacs-directory))
(defvar tmp-dir (expand-file-name "tmp" user-emacs-directory))

(defvar lisp-core-dir (expand-file-name "core" lisp-dir))

(add-to-list 'load-path lisp-dir)
(add-to-list 'load-path lisp-core-dir)

;; configure the custom file about the positin of saving.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
 (when (file-exists-p custom-file)
  (load custom-file))

;----------------------------------------------------------------------
(require 'init-core)
;----------------------------------------------------------------------
(require 'init-evil)
(require 'init-color-theme)
(require 'init-smex)		   ;minibuffer补全
(require 'init-powerline)      ;minibuffer上面的状态栏
(require 'init-yasnippet)      ;模板补全
(require 'init-auto-complete)  ;自动补全
(require 'init-go-mode)		   ;Go-mode
(require 'init-jedi)           ;Pyhon 自动补全
;----------------------------------------------------------------------
(provide 'init)
