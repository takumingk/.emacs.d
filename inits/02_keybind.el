;;; 02_keybind.el --- 
;; Copyright (C) 2016  takuming
;; Keywords:

(global-set-key (quote [67108927]) (quote redo))

;; (setq default-case-fold-search nil) ; 検索時に大文字小文字を区別
;; find-fileのファイル名補完で大文字小文字を区別しない設定
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq next-line-add-newlines nil)

;; shellでパスワードを隱す
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; keyの設定
(global-set-key "\C-h" 'backward-delete-char)                  ;;Ctrl-Hでバックスペース
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'shell)
(global-set-key "\M-r" 'grep)
(global-set-key "\M-d" 'gdb)
(global-set-key "\C-cg" 'grep)
(global-set-key "\C-c\C-s" 'replace-string)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-u" 'uncomment-region)
;; windmove  Shift + arrow
(windmove-default-keybindings)
(defvar windmove-wrap-around t)

; C-tab でウィンドウを変更
(define-key global-map[C-tab] 'other-window)
(define-key global-map [C-S-iso-lefttab] (lambda () (interactive) (other-window -1)))
;; 画面分割+分割先に移動
(global-set-key "\C-x8"
                       (lambda () (interactive)
                         (split-window-vertically)
                         (other-window 1)))
(global-set-key "\C-x9"
                       (lambda () (interactive)
                         (split-window-horizontally)
                         (other-window 1)))
(global-unset-key "\C-x\C-p")
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

;; M-x *** 短縮形
(defalias 'qr 'query-replace)
(defalias 'qre 'query-replace-regexp)
(defalias 'rs 'replace-string)
(defalias 'rr 'replace-regexp)
(defalias 'gl 'goto-line)
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'ae 'align-entire)
(defalias 'ar 'align-regexp)
(defalias 'mg 'moccur-grep)
(defalias 'mgf 'moccur-grep-find)

;================================================================================
; for japanese print
;================================================================================
(defvar ps-multibyte-buffer 'non-latin-printer)
(require 'ps-mule)
(defalias 'ps-mule-header-string-charsets 'ignore)

;;================================================================================
;; grep-edit
;;================================================================================
(require 'grep)
(require 'grep-edit)

(defadvice grep-edit-change-file (around inhibit-read-only activate)
  ""
  (let ((inhibit-read-only t))
    ad-do-it))
;; (progn (ad-disable-advice 'grep-edit-change-file 'around 'inhibit-read-only) (ad-update 'grep-edit-change-file)) 

(defun my-grep-edit-setup ()
  (define-key grep-mode-map '[up] nil)
  (define-key grep-mode-map "\C-c\C-c" 'grep-edit-finish-edit)
  (message (substitute-command-keys "\\[grep-edit-finish-edit] to apply changes."))
  (set (make-local-variable 'inhibit-read-only) t)
  )
(add-hook 'grep-setup-hook 'my-grep-edit-setup t)

;;================================================================================
;; M-x my-grep
;; grep(カーソル付近の単語をデフォルトの検索語に)
(defun my-grep ()
"grep the whole directory for something defaults to term at cursor position"
  (interactive)
  (defvar default-word (thing-at-point 'symbol))
  (defvar needle1 (or (read-string (concat "grep for <" default-word "> ")) default-word))
  (defvar needle1 (if (equal needle1 "") default-word needle1))
  (defvar default-dir default-directory)
  (defvar needle2 (or (read-string (concat "target directory <" default-dir ">: ")) default-dir))
  (defvar needle2 (if (equal needle2 "") default-dir needle2))
;  (grep (concat "grep -s -i -n " needle1 " * /dev/null")))
  (grep (concat "grep -s -i -n " needle1 " "needle2)))
(global-set-key "\C-x." 'my-grep)

;;================================================================================
;; M-x multi-term
;; http://sakito.jp/emacs/emacsshell.html#shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(require 'multi-term)
(setq multi-term-program shell-file-name)
(setq multi-term-program "/bin/zsh")
(add-to-list 'term-unbind-key-list '"C-g")
(add-to-list 'term-unbind-key-list '"M-x")
(add-hook 'term-mode-hook
         '(lambda ()
            ;; C-h を term 内文字削除にする
            ;(define-key term-raw-map (kbd "C-h") 'term-send-backspace)
            ;; C-y を term 内ペーストにする
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            ))
(global-set-key (kbd "C-x t") '(lambda ()
                                (interactive)
                                (multi-term)))
