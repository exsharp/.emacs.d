(require-package 'go-mode)
(require-package 'go-autocomplete)


;(add-hook 'go-mode-hook (lambda ()(
(require 'auto-complete)
;(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(require 'go-autocomplete)
 ; )))

(provide 'init-go-mode)
