;; 基于http://emacser.com/cedet.htm和http://emacser.com/built-in-cedet.htm修改得到
;; 英文参考这个http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html

;; 启用CEDET，设置semantic
(setq semantic-default-submodes '(global-semanticdb-minor-mode  ;; 保存分析内容
								  global-semantic-idle-scheduler-mode  ;; Emacs空闲时自动分析buffer内容
								  global-semantic-idle-summary-mode  ;; minibuffer显示函数原型
								  ;;global-semantic-idle-completions-mode  ;; 自动提示可以补全的内容
								  ;;global-semantic-decoration-mode  ;; 类/函数上方加一条线
								  global-semantic-highlight-func-mode  ;; 高亮显示光标所在函数
								  ;;global-semantic-stickyfunc-mode  ;; 当前函数名显示在buffer上
								  global-semantic-mru-bookmark-mode  ;; 书签记录
								  global-semantic-idle-local-symbol-highlight-mode))  ;; 高亮光标处的同名变量
(semantic-mode 1)  ;; 启用semantic
;; 最近修改过的内容高亮
(global-semantic-highlight-edits-mode (if window-system 1 -1))
;; 标识无法解析的内容
(global-semantic-show-unmatched-syntax-mode 1)
;; Mode Line上显示当前解析状态
(global-semantic-show-parser-state-mode 1)

;; 自定义头文件查找目录
(defconst user-include-dirs (list ".." "../include"))
(defconst win32-include-dirs
	(list "C:\\mingw-w64\\x86_64-4.9.2-posix-seh-rt_v4-rev2\\mingw64\\x86_64-w64-mingw32\\include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs user-include-dirs))
	(when (eq system-type 'windows-nt)
		(setq include-dirs (append include-dirs win32-include-dirs)))
	(mapc (lambda (dir)
				(semantic-add-system-include dir 'c++-mode)
				(semantic-add-system-include dir 'c-mode))
		  include-dirs))

;; 导入高级的名字补全，信息显示等
(require 'semantic/ia)
;; 代码跳转，跳到变量函数的定义
(global-set-key [f12] 'semantic-ia-fast-jump)
;; 跳回
(defadvice push-mark (around semantic-mru-bookmark activate)
	(semantic-mrub-push semantic-mru-bookmark-ring (point) 'mark)
	ad-do-it)
(defun semantic-ia-fast-jump-back ()
	(interactive)
	(if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
		(error "Semantic Bookmark ring is currently empty"))
	(let* ((ring (oref semantic-mru-bookmark-ring ring))
        (alist (semantic-mrub-ring-to-assoc-list ring))
        (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))
(global-set-key [S-f12] 'semantic-ia-fast-jump-back)  ;; 跳回
;; 自动补全
(defun auto-compelet-cedet-hook ()
	(local-set-key [(control return)] 'semantic-ia-complete-symbol)  ;; C RET，不会多一个窗口
	(local-set-key "\C-c>" 'semantic-complete-analyze-inline)  ;; C-c>，会多一个窗口
	(local-set-key [M-S-f12] 'semantic-analyze-proto-impl-toggle))  ;; 原型
(add-hook 'c-mode-common-hook 'auto-compelet-cedet-hook)
;; 点号和>后补全提示，会在新的窗口里显示可用的补全
;;(defun auto-c-mode-cedet-hook ()
;;	(local-set-key "." 'semantic-complete-self-insert)
;;	(local-set-key ">" 'semantic-complete-self-insert))
;;(add-hook 'c-mode-common-hook 'auto-c-mode-cedet-hook)

(provide 'init-cedet)