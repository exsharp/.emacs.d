(require-package 'jedi)

(setq python-environment-directory 
	(expand-file-name "python-environments" tmp-dir))

(setq jedi:get-in-function-call-delay 0)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'init-jedi)