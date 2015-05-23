;(require-package 'auto-complete-clang)
(require 'auto-complete-clang)  
(setq ac-clang-auto-save nil)  

;;(setq ac-quick-help-delay 0.5)  

;;echo "" | g++ -v -x c++ -E -  获得下面的列表
(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar(lambda (item)(concat "-I" item))  
               (split-string  
                "  
 C:/mingw-w64/x86_64-4.9.2-posix-seh-rt_v4-rev2/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/4.9.2/include
 C:/mingw-w64/x86_64-4.9.2-posix-seh-rt_v4-rev2/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/4.9.2/include-fixed
 C:/mingw-w64/x86_64-4.9.2-posix-seh-rt_v4-rev2/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/4.9.2/../../../../x86_64-w64-mingw32/include
 C:/mingw-w64/x86_64-4.9.2-posix-seh-rt_v4-rev2/mingw64/lib/gcc/../../x86_64-w64-mingw32/include/c++
 C:/mingw-w64/x86_64-4.9.2-posix-seh-rt_v4-rev2/mingw64/lib/gcc/../../x86_64-w64-mingw32/include/c++/x86_64-w64-mingw32
 C:/mingw-w64/x86_64-4.9.2-posix-seh-rt_v4-rev2/mingw64/lib/gcc/../../x86_64-w64-mingw32/include/c++/backward

"))))  

(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags  
(my-ac-config)  

(provide 'init-auto-complete-clang)