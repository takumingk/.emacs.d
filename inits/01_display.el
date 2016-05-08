;;; display.el --- 

;; Copyright (C) 2016  takuming
;; Keywords: faces,

;; scroll bar on right
(set-scroll-bar-mode 'right)
;; tool bar -> default off
(tool-bar-mode 0)
(setq inhibit-startup-message t)
;; yes-or-no -> y-or-n
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq require-final-newline t)
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))
(temp-buffer-resize-mode t)
(line-number-mode 1)
;; keta-bangou
(column-number-mode t)
;; リージョンをハイライト表示.
(transient-mark-mode t)
;; 空白行を表示
(setq-default indicate-empty-lines t)

(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)

;;;; default window
(setq default-frame-alist
      (append (list
;;        '(foreground-color . "white")
;;         '(background-color . "LemonChiffon")
;;         '(background-color . "#DDDDDD")
;;	    '(background-color . "gray34")
;;         '(border-color . "black")
               '(mouse-color . "white")
               '(cursor-color . "white")
;;          '(face-background 'modeline "navy")
         '(width . 120)
         '(height . 85)
;         '(font . "Ricty")
         '(top . 0)
         '(left . 0)
         '(line-space . "0")
         )
              default-frame-alist))
;; Color settings
(global-font-lock-mode t)

;; 対応する括弧の強調表示
(show-paren-mode t)

;; 行の折り返し nil->折り返す, t->右へ続く
(setq truncate-lines nil)
;; C-x 3 とかしたとき
(setq truncate-partial-width-windows t)
;; clock
(display-time)
(defvar display-time-format nil)
(defvar display-time-24hr-format t)
(defvar display-time-day-and-date t)
;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
