(require-package 'go-mode)


;(add-hook 'go-mode-hook (lambda ()(
(require 'auto-complete)
;(require 'go-mode)
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)
(require 'go-autocomplete)
 ; )))

(provide 'init-go-mode)
