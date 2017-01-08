;(setq server-socket-dir "~/.emacs.d/tmp/server")
;(setq server-auth-dir "~/.emacs.d/tmp/server")
;(server-start)

(setq debug-on-error t)

;; 编码设置 begin
(set-language-environment 'utf-8)
; 如果不写下面两句，只写
(prefer-coding-system 'utf-8)
; 编码设置 end

(setq-default cursor-type 'bar) 
;;设置光标为竖线

(global-auto-revert-mode t)
;;在外部更新文件后，自动更新

(set-fontset-font "fontset-default" 'gb18030 '("Microsoft YaHei" . "unicode-bmp"))
(setq default-frame-alist
      '( (font . "Consolas 11")
         (Vertical-scroll-bars)  
         (top . 30)
         (left . 150)                               
         (width . 100)
         (height . 30)           
        ;(background-color . "black")
        ;(foreground-color . "grey")
         (cursor-color     . "gold1")
         (mouse-color      . "gold1")
         (tool-bar-lines . 0)
         (menu-bar-lines . 1)
         (right-fringe)
         (left-fringe)))

(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
;(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
;(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
;(setq display-time-interval 10);;时间的变化频率，单位多少来着？

;;设置打开文件的缺省路径
(setq default-directory "C:\\Users\\zfliu\\Desktop")

;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(ido-mode t)

(setq visible-bell t)
;;关闭烦人的出错时的提示声
(setq ring-bell-function 'ignore)
;;到文件最上或最下不闪屏

(setq inhibit-startup-message t)
;;关闭emacs启动时的画面

(fset 'yes-or-no-p 'y-or-n-p)
;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。

(global-linum-mode t)
;;在buffer右侧显示行号
(global-hl-line-mode t)
;;强调当前行
(setq column-number-mode t) 
(setq line-number-mode t)
;;显示行列号

(setq kill-ring-max 200)
;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西

(setq-default c-basic-offset 4)
;;(setq c-default-style "linux")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list ())
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

(setq enable-recursive-minibuffers t)
;;可以递归的使用 minibuffer

(setq scroll-step 1
  scroll-margin 3  scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。

(setq major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill) 
;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode

(electric-pair-mode 1);;自动补全一对的
(show-paren-mode 1);;打开括号匹配显示模式
;(setq show-paren-delay 0)
;(setq show-paren-style 'parenthesis)
;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。

(setq frame-title-format "%b");
;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。

(setq uniquify-buffer-name-style 'forward);
;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的foobar<?> 形式。

(setq auto-image-file-mode t)
;;让 Emacs 可以直接打开和显示图片。

(auto-compression-mode t)   
;打开压缩文件时自动解压缩。

(setq global-font-lock-mode t)
;;进行语法加亮。

(setq-default kill-whole-line t);
;; 在行首 C-k 时，同时删除该行。

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码

(setq make-backup-files t);; 不生成备份文件
(setq vc-make-backup-files t);;使用版本控制系统的时候也启用备份功能
(setq version-control t);;启用版本控制，即可以备份多次
(setq kept-old-versions 4);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
(setq kept-new-versions 6);;备份最新的版本1次，理解同上
(setq delete-old-versions t);;删掉不属于以上3中版本的版本
(setq backup-by-copying t);;备份设置方法，直接拷贝
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp/backups/")));;设置备份文件的路径

;(setq auto-save-mode nil) 
;自动保存模式

(setq auto-save-list-file-prefix "~/.emacs.d/tmp/auto-save/")
;(setq auto-save-list-file-prefix (expand-file-name "auto-save" tmp-dir))
;(setq auto-save-file-name-transforms '((".*"  ,"~/.emacs.d/backups/auto-save/" t)))
;(setq auto-save-default nil) ;
;不生成 #filename# 临时文件 

(put 'scroll-left 'disabled nil)     ;允许屏幕左移
(put 'scroll-right 'disabled nil)    ;允许屏幕右移
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil) 
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;;把这些缺省禁用的功能打开。

(setq x-select-enable-clipboard t)
;;允许emacs和外部其他程序的粘贴

(setq mouse-yank-at-point t);
;;使用鼠标中键可以粘贴

(setq user-full-name "zfliu")
(setq user-mail-address "zfliu_6@163.com")
;;设置有用的个人信息,这在很多地方有用。

(setq require-final-newline t)
;; 自动的在文件末增加一新行

(setq-default transient-mark-mode t)
;;Non-nil if Transient-Mark mode is enabled.

(setq man-notify-method 'pushy)
;; 当浏览 man page 时，直接跳转到 man buffer。

(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;;设置home键指向buffer开头，end键指向buffer结尾

(global-set-key (kbd "C-,") 'scroll-left)
;; "C-,"设为屏幕左移命令
(global-set-key (kbd "C-.") 'scroll-right)
;; "C-."设为屏幕右移命令

(provide 'init-ui)
;;; init-ui.el ends here
