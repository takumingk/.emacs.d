(require 'shackle)
(setq shackle-rules
      '(;; *compilation*は下部に2割の大きさで表示
;        (compilation-mode :align below :ratio 0.2)
        ;; ヘルプバッファは右側に表示
        ("*Help*" :align right)
        ;; 補完バッファは下部に3割の大きさで表示
        ("*Completions*" :align below :ratio 0.3)
        ;; M-x helm-miniは下部に7割の大きさで表示
;        ("*helm mini*" :align below :ratio 0.7)
        ;; 他のhelmコマンドは右側に表示 (バッファ名の正規表現マッチ)
;        ("\*helm" :regexp t :align right)
        ;; 上部に表示
;        ("foo" :align above)
        ;; 別フレームで表示
;        ("bar" :frame t)
        ;; 同じウィンドウで表示
;        ("baz" :same t)
        ;; ポップアップで表示
;        ("hoge" :popup t)
        ;; 選択する
;        ("abc" :select t)
        ))
;(setq shackle-lighter "s")
(shackle-mode 1)

;;; C-zで直前のウィンドウ構成に戻す
(winner-mode 1)
(global-set-key (kbd "C-z") 'winner-undo)
;;;; test
(display-buffer (get-buffer-create "*compilation*"))
(display-buffer (get-buffer-create "*Help*"))
;; (display-buffer (get-buffer-create "foo"))
;; (display-buffer (get-buffer-create "bar"))
;; (display-buffer (get-buffer-create "baz"))
;; (display-buffer (get-buffer-create "hoge"))
;; (display-buffer (get-buffer-create "abc"))
