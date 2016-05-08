;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    C++ Coding Standardに合わせたコーディングスタイル定義
;;       http://www.possibility.com/Cpp/CppCodingStandard.html
;;
;;    ver: 2.4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; マイナーモードの定義
(easy-mmode-define-minor-mode
 pxt-mode ;; モード名は、-mode
 "This mode sets the indent and the rule to coding Pxt-source." ;; ドキュメント
 nil ;; 初期値
 " Pxt-Style" ;; on の時のモード行への表示
 nil ;; マイナーモード用キーマップの初期値
 )

(defconst indent-style
  '(
    ;; 変数の位置を揃えたい人向けにTABは4(基本的に入力はNG)
    (tab-width . 4)
    ;; 基本となるインデント
    (c-basic-offset . 4)
    (tab-stop-list . '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                       64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
    ;; インデントは空白文字で行う(TABコードを空白に変換)
    (indent-tabs-mode . nil)
    ;; 諸々のインデント設定
    (c-offsets-alist . (;; 関数の引数listの引数の1行目
                        (arglist-intro . c-lineup-arglist-intro-after-paren)
                        ;; 関数の引数listの閉じ括弧
                        (arglist-close . c-lineup-arglist)
                        ;; 関数の引数listの開き括弧の行に引数がある場合の引数の2行目以降
                        (arglist-cont-nonempty . c-lineup-arglist-intro-after-paren)
                        ;; Switch文内のcaseラベル
                        (case-label . +)
                        ;; 文の継続する行
                        (statement-cont . c-lineup-math)
                        ;; 中括弧の設定
                        (brace-list-intro . c-lineup-arglist-intro-after-paren)
                        ;; 行が開き中括弧で始まるときのenumのlistや静的配列の初期化listの2行目以降のentry
                        (brace-entry-open . 0)
                        ;; Enumのlistや静的配列の初期化listの開き中括弧
                        (brace-list-open . 0)
                        ;; Enumのlistや静的配列の初期化listの閉じ中括弧
                        (brace-list-close . 0);c-lineup-arglist-intro-after-paren)
                        ;; Enumのlistや静的配列の初期化listのentry
                        (brace-list-intro  . 4)
                        ;; 部分文の開き中括弧(for, while等の中括弧)
                        (substatement-open . 0)
                        ;; 名前空間内の要素
                        (innamespace . 0)
                        ;; 外部言語block内の要素(extern等)
                        (inextern-lang . 0)
                        ;; 通常のラベル(goto等)
                        (label . 0)
                        ;; class定義の開き中括弧
                        (class-open . 0)
                        ;; public, private等のラベル
                        (access-label . -)
                        ;; Class内のinline methodの開き中括弧
                        (inline-open . nil)
                        ))
    ;; 挿入された余計な空白文字のキャンセル条件の設定
    (c-cleanup-list . (brace-else-brace
                       brace-elseif-brace
                       brace-catch-brace
                       empty-defun-braces
                       defun-close-semi
                       list-close-comma
                       scope-operator))
    )
  "Robot C/C++ Programming Style")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行末のスペースをファイル保存時に自動削除
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun delete-trailing-whitespace-before-save ()
;;   (if (eq t pxt-mode) (delete-trailing-whitespace)))
;; (add-hook 'before-save-hook 'delete-trailing-whitespace-before-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ファイル保存時にタブをスペースに変換
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun untabify-before-save ()
;;   (if (eq t pxt-mode) (untabify 1 (point-max))))

;; (add-hook 'before-save-hook 'untabify-before-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab, 全角スペース, 行末のスペースを強調
;; 書式間違いを強調
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defface my-face-tab                '((t (:background "LightBlue"))) nil :group 'my-faces)
(defface my-face-zenkaku-spc        '((t (:background "white"))) nil :group 'my-faces)
(defface my-face-spc-at-eol         '((t (:background "gray80"))) nil :group 'my-faces)
(defface my-face-format-is-wrong    '((t (:background "PeachPuff4"))) nil :group 'my-faces)
(defface my-face-format-is-warning  '((t (:background "bisque4"))) nil :group 'my-faces)
(defface my-face-not-use-format     '((t (:background "goldenrod4"))) nil :group 'my-faces)
(defvar my-face-tab                 'my-face-tab)
(defvar my-face-zenkaku-spc         'my-face-zenkaku-spc)
(defvar my-face-spc-at-eol          'my-face-spc-at-eol)
(defvar my-face-format-is-wrong     'my-face-format-is-wrong)
(defvar my-face-format-is-warning   'my-face-format-is-warning)
(defvar my-face-not-use-format      'my-face-not-use-format)
(defvar my-faces-features nil)

(defun rule-highlight ()
  (interactive)
  (setq font-lock-set-defaults nil)
  (font-lock-set-defaults)
  (font-lock-add-keywords 'nil '(
     ;; タブ
     ("\t" 0 my-face-tab append)
     ;; 全角スペース
     ("　" 0 my-face-zenkaku-spc append)
     ;; 行末のスペース,タブ
     ("[ \t]+$" 0 my-face-spc-at-eol append)
     ;; ;; 括弧内のスペース
     ("\\((\s+[-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\ ]+\\)" 0 my-face-format-is-wrong append)
     ("\\([-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\ ]+\s+)\\)" 0 my-face-format-is-wrong append)
     ("\\([-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\\[\\]\ ]+\s+)\\)" 0 my-face-format-is-wrong append)
     ("\\(\"\s+)\\)" 0 my-face-format-is-wrong append)
     ;; キーワードの後にスペース
     ("^\s+\\(switch\\|if\\|else if\\|while\\|for\\|sizeof\\|try\\|catch\\|throw\\|explicit\\)\(" 0 my-face-format-is-wrong append)
     ;; doの後ろに{
     ("^\s*do\s*{" 0 my-face-format-is-wrong append)
     ;; elseと中括弧の間のスペース
     ("\\(}else{\\|}else\\|else{\\)" 0 my-face-format-is-wrong append)
     ;; )の後ろに{
     (")\s*{" 0 my-face-format-is-wrong append)
     ;; return式を括弧で囲んではいけない
     ("return\s*((*[^()]*)*);" 0 my-face-format-is-wrong append)
     ;; プリプロセッサディレクティブはインデントするべきではない
     ("^[\s\t]+#\\(include\\|pragma\\|define\\|undef\\|if\\|elsif\\|else\\|ifdef\\|ifndef\\|endif\\|error\\|line\\)\s+[-+*/a-zA-Z0-9_()\s\t]+" 0 my-face-format-is-wrong append)
     ;; #ifdefは使わない
     ("^#ifn?def\s+[-+*/a-zA-Z0-9_()\s\t]+" 0 my-face-not-use-format append)
     ;; #pragma once を使ってはいけない
     ("#pragma once" 0 my-face-format-is-wrong append)
     ;; gotoはなるべく使わないようにしましょう
     ("goto" 0 my-face-format-is-warning append)
     ;; labelはclass内でのpublic:と分ける
     ("^\\([^\\(public\\|private\\)]\\):" 0 my-face-format-is-warning append)
     ;; 1行ifの閉じ括弧の後ろはスペース
     ;("if ([-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\ \s]+)[-_!~*'a-zA-Z0-9;/?:@&=+$,%#\]" 0 my-face-format-is-wrong append)
     ))
  (font-lock-fontify-buffer)
  ;;インデントセット
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent t)
  (c-add-style "robot" indent-style t)
)

(defun cancel-highlight ()
  (interactive)
  (setq font-lock-set-defaults nil)
  (font-lock-set-defaults)
  (font-lock-fontify-buffer)
  ;; インデント解除(gnuに戻す)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent nil)
  (c-set-style "gnu")
)

(defun pxt-mode-init ()
  (if (null pxt-mode) (cancel-highlight)
    (rule-highlight)))

(add-hook 'pxt-mode-hook 'pxt-mode-init)

(provide 'indent-style)

;; このファイルに間違いがあった場合に全てを無効にします
(put 'eval-expression 'disabled nil)
