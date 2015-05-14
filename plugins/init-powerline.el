(require-package 'powerline)

(if (display-graphic-p)
    (progn
      (require 'powerline)
      (powerline-center-evil-theme)))

(defun graphic-powerline-config ()
  "powerline setting for graphic"
  (interactive)
  (progn
    ;(setq powerline-arrow-shape 'arrow)
    (custom-set-faces
     '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
     '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil))))
     )
    (setq powerline-active1 "")
    (setq powerline-active2 "white")
    )
  )
(defun terminal-powerline-config ()
  "powerline setting for termial"
  (interactive)
  (setq powerline-arrow-fade-left t)
  (setq powerline-active1 "grey22")
  (setq powerline-active2 "grey22")
  (custom-set-faces
   '(mode-line ((t (:foreground "grey44" :background "grey22" :box nil))))
   '(mode-line-inactive ((t (:foreground "grey22" :background "grey44" :box nil))))
   ))

(provide 'init-powerline)
