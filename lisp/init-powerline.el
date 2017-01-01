(require-package 'powerline)
(require-package 'spaceline)

(require 'powerline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)

;(setq powerline-height 20)
;(setq powerline-default-separator 'arrow)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)



(defun graphic-powerline-config ()  
  "powerline setting for graphic"  
  (interactive)  
  (progn  
   (setq powerline-arrow-shape 'arrow)  
   (custom-set-faces  
    '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))  
    '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil))))  
    )  
   (setq powerline-color1 "#0088cc")  
   (setq powerline-color2 "white")  
   )  
  )  
  
(defun terminal-powerline-config()  
   " powerline setting for terminal"  
   (interactive)  
   (setq powerline-arrow-shape 'arrow)  
   (setq powerline-color1 "grey22")  
   (setq powerline-color2 "grey22")   
   (custom-set-faces  
    '(mode-line ((t (:foreground "grey44" :background "grey22" :box nil))))  
    '(mode-line-inactive ((t (:foreground "grey22" :background "grey44" :box nil))))  
    ))  
  
;; "根据是否图形界面加载配置"  
; (if (display-graphic-p) 
; 	(progn 
; 		;(graphic-powerline-config)
; 		(powerline-center-evil-theme)) 
;   (terminal-powerline-config))

(provide 'init-powerline)
