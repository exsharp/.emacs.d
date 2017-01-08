(require-package 'sr-speedbar)
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)	
(setq speedbar-show-unknown-files t)
(global-set-key (kbd "<f4>") 'sr-speedbar-toggle)

(provide 'init-sr-speedbar)