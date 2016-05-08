;;; 11_tex.el --- 
;; Copyright (C) 2016  takuming
;; Keywords: tex, abbrev, bib,

;;================================================================================
;; yatex
;; from http://www.nls.ics.saitama-u.ac.jp/~tohru/Lectures/ICSEXP/KadaiB/how2useyatex.html
;; (setq load-path (cons (expand-file-name "/usr/local/share/emacs/site-lisp/yatex") load-path))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq tex-command "platex -synctex=1")
(setq dvi2-command "evince ")
;; print コマンド
;; (setq dviprint-command-format "dvipdfmx -vv %s")
(setq YaTeX-typeset-auto-rerun nil)
;; 漢字コード
;;   1=Shift JIS >== Windows なら
;;   2=JIS
;;   3=EUC
;;   4=UTF-8
;; (setq YaTeX-kanji-code 3) ; 4にするとprosperが失敗する
;; Bibtex
(setq bibtex-command "jbibtex")
;; 色付け
(setq YaTeX-use-font-lock t)
;; for align
(setq YaTeX-use-AMS-LaTeX t)
(add-hook ' yatex-mode-hook 
 '(
    lambda () (auto-fill-mode -1)
  )
)
;; YaHtml-mode
(setq auto-mode-alist
      (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(setq yahtml-www-browser "firefox")
;; RefTeX with YaTeX                                                                      
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)
             ;; (YaTeX-define-key "p" 'latex-math-preview-expression)
             ;; (YaTeX-define-key "\C-p" 'latex-math-preview-save-image-file)
             ;; (YaTeX-define-key "j" 'latex-math-preview-insert-symbol)
             ;; (YaTeX-define-key "\C-j" 'latex-math-preview-last-symbol-again)
             ;; (YaTeX-define-key "b" 'latex-math-preview-beamer-frame)
             ))
;; (setq latex-math-preview-in-math-mode-p-func 'YaTeX-in-math-mode-p)

;;================================================================================
;; latex-math-preview
;; http://www.emacswiki.org/emacs-en/LaTeXMathPreview
(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)
(setq latex-math-preview-tex-to-png-for-preview '(platex dvipng))
(setq latex-math-preview-tex-to-png-for-save '(platex dvipng))
(setq latex-math-preview-tex-to-eps-for-save '(platex dvips-to-eps))
(setq latex-math-preview-beamer-to-png '(platex dvipdfmx gs-to-png))

