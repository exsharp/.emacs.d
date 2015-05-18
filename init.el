;; configure position of saving and the sequence of loading about files.
;; the init-ui must put the first and the init-elpa must pu the second.

(add-to-list 'load-path "~/.emacs.d/core")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/modules")

;; configure the position of saving.
(defvar root-dir (file-name-directory load-file-name)
  "The root dir of the Emacs DDtoma distribution.")
(defvar core-dir (expand-file-name "core" root-dir)
  "The home of core functionality.")
(defvar plugins-dir (expand-file-name "plugins" root-dir)
  "This directory houses all of the plugins.")
(defvar modules-dir (expand-file-name "modules" root-dir)
  "This directory houses all of the built-in moudules or adding other by myself")

;; configure the custom file about the positin of saving.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
 (when (file-exists-p custom-file)
  (load custom-file))

;----------------------------------------------------------------------
(require 'init-ui)
(require 'init-elpa)
(require 'init-utils)
(require 'init-func)
;----------------------------------------------------------------------
(require 'init-evil)
(require 'init-color-theme)
(require 'init-smex)		   ;minibuffer补全
(require 'init-powerline)      ;minibuffer上面的状态栏
(require 'init-yasnippet)      ;模板补全
(require 'init-auto-complete)  ;自动补全
(require 'init-tabbar)         ;tab标签
(require 'init-linum-relative) ;相对的行数
(require 'init-jedi)           ;python补全服务
(require 'init-ace-jump-mode)
(require 'init-web-mode)
(require 'init-git)
;(require 'init-paredit)
(require 'init-smartparens)
;(require 'init-sr-speedbar)
(require 'init-go-mode)
(require 'init-flycheck)       ;语法检查
(require 'init-flyspell)
(require 'init-highlight-parentheses)
;----------------------------------------------------------------------

(provide 'init)
