;;; japanese.el --- 

;; Copyright (C) 2016  takuming

;; Keywords:

;;;  Global settings
(put 'narrow-to-region 'disabled nil)
(put 'eval-expression 'disabled nil)

;;==================================
;; for copy and paste between firefox
(cond (window-system
       (setq x-select-enable-clipboard t)
       ))

(mouse-wheel-mode)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 5)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 全モード共通インデント設定
;; tab ではなく space を使う
(setq-default indent-tabs-mode nil)
;; tab 幅を 4 に設定
(setq-default tab-width 4)

;; ファイルの先頭が#!で始まるファイルは実行権をつけて保存してくれる
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)
