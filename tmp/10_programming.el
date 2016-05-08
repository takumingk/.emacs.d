;;; 10_programming.el --- 

;; Copyright (C) 2016  takuming

;; Author: takuming <takumi_kamioka@n.f.rd.honda.co.jp>
;; Keywords:

;;; Matlab
(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t) 
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
(defvar matlab-shell-command "/usr/local/bin/matlab"  
  matlab-shell-command-swithes '("-nodesktop -v=glnx86")  
  matlab-indent-function-body nil  
  matlab-highlight-cross-function-variables t  
  matlab-return-add-semicolon nil  
  matlab-show-mlint-warnings t  
  mlint-programs '("/usr/local/matlab/bin/glnx86/mlint")
  matlab-mode-install-path (list (expand-file-name "~/Programs/matlab/"))
  matlab-shell-history-file "~/.matlab/R2007a/history.m"
  matlab-shell-ask-MATLAB-for-completions t
  mlint-flags '("-all" "-id")
  )

(autoload 'mlint-minor-mode "mlint" nil t)  
(add-hook 'matlab-mode-hook (lambda () (mlint-minor-mode 1)))  
(add-hook 'matlab-shell-mode-hook 'ansi-color-for-comint-mode-on)  
(add-hook 'matlab-shell-mode-hook  
          (lambda () (setenv "LANG" "C")))  
(eval-after-load "shell"  
  '(define-key shell-mode-map [down] 'comint-next-matching-input-from-input))  
(eval-after-load "shell"  
  '(define-key shell-mode-map [up] 'comint-previous-matching-input-from-input))  
(defvar matlab-mode-hook
      '(lambda ()
         (setq matlab-auto-fill t) 
         (setq fill-column 200)                  ; where auto-fill should wrap
         (setq matlab-fill-fudge-hard-maximum 200)
;         (matlab-mode-hilit)
;         (setq matlab-function-indent t)        ; if you want function bodies indented
         (setq matlab-functions-have-end nil)
         (setq matlab-indent-level 4)
         (setq matlab-indent-function-body nil)
         (define-key matlab-mode-map "\C-c\C-c" 'comment-region)
         (define-key matlab-mode-map "\C-u\C-c" 'uncomment-region)
         ))

;;; C++-mode, C-mode settings
(setq auto-mode-alist
      (cons '("\\.inl\\'" . c++-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.c$" . c-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))

;; C++, C モードの設定
;(require 'indent-style)
(add-hook 'c-mode-common-hook 'pxt-mode)
(add-hook 'c++-mode-hook
          '(lambda ()
             ;; (gtags-mode 1)
             ;; (gtags-make-complete-list)
;             (setq c++-class-member-indent tab-width)
;             (setq c++-friend-offset 0)
             ;(setq c-auto-newline nil)
             ;(setq c-tab-always-indent nil)
             (cpp-highlight-buffer t)
;             (hide-ifdef-mode t)
             (define-key c++-mode-map "\C-cu" 'uncomment-region)
             ;(define-key c++-mode-map "\M-gg" 'goto-line)
             (define-key c++-mode-map (kbd "C-c k") 'my-insert-printf-debug)
             (define-key c++-mode-map (kbd "C-c m") 'my-insert-cc-comment)
             (define-key c++-mode-map (kbd "C-c i") 'my-insert-input-comment)
             (define-key c++-mode-map (kbd "C-c o") 'my-insert-output-comment)
             (define-key c++-mode-map (kbd "C-c b") 'my-insert-inout-comment)
             (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
             (which-function-mode 1)
             ))

(add-hook 'c-mode-hook
          '(lambda ()
             ;; (gtags-mode 1)
             ;; (gtags-make-complete-list)
             ;(setq c-auto-newline nil)
             ;(setq c-tab-always-indent nil)
             ;(modify-syntax-entry ?_ "w" c-mode-syntax-table)
             (cpp-highlight-buffer t)
;             (hide-ifdef-mode t)
             (define-key c-mode-map "\C-cu" 'uncomment-region)
             (define-key c-mode-map (kbd "C-c k") 'my-insert-printf-debug)
             (define-key c-mode-map (kbd "C-c m") 'my-insert-c-comment)
             (define-key c-mode-map (kbd "C-c i") 'my-insert-input-comment)
             (define-key c-mode-map (kbd "C-c o") 'my-insert-output-comment)
             (define-key c-mode-map (kbd "C-c b") 'my-insert-inout-comment)
             ;(modify-syntax-entry ?_ "w" c-mode-syntax-table)
             (which-function-mode 1)
))
;; #if 0 or 1 highlight
(setq cpp-known-face 'default)
(setq cpp-unknown-face 'default)
(setq cpp-face-type 'light)
(setq cpp-known-writable 't)
(setq cpp-unknown-writable 't)
(setq cpp-edit-list
'(("0"
(background-color . "gray40")
nil both nil)
("1" nil
(background-color . "gray40")
both nil)))

;=======================================================================
; GDB ??
;=======================================================================
(setq gdb-many-windows t)
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
(setq gdb-use-separate-io-buffer t)
(setq gud-tooltip-echo-area t)

;; C-c c for compile
(define-key mode-specific-map "c" 'compile)

;; for doxygen
;;(push "~/lib/emacs/lisp/" load-path) ;
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(setq doxymacs-doxygen-style "JavaDoc")
(setq user-mail-address "takumi_kamioka@n.f.rd.honda.co.jp")

;================================================================================
; for svn
;================================================================================
;;; svn commit したときのバッファを utf-8 にする
(add-hook 'svn-log-edit-mode-hook
          '(lambda ()
             (set-buffer-file-coding-system 'utf-8)))

;;================================================================================
;; elisp auto compile
;; http://d.hatena.ne.jp/rubikitch/20100423
;;================================================================================
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
