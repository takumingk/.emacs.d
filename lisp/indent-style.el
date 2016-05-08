;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    C++ Coding Standard�˹�碌�������ǥ��󥰥����������
;;       http://www.possibility.com/Cpp/CppCodingStandard.html
;;
;;    ver: 2.4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; �ޥ��ʡ��⡼�ɤ����
(easy-mmode-define-minor-mode
 pxt-mode ;; �⡼��̾�ϡ�-mode
 "This mode sets the indent and the rule to coding Pxt-source." ;; �ɥ������
 nil ;; �����
 " Pxt-Style" ;; on �λ��Υ⡼�ɹԤؤ�ɽ��
 nil ;; �ޥ��ʡ��⡼���ѥ����ޥåפν����
 )

(defconst indent-style
  '(
    ;; �ѿ��ΰ��֤�·�������͸�����TAB��4(����Ū�����Ϥ�NG)
    (tab-width . 4)
    ;; ���ܤȤʤ륤��ǥ��
    (c-basic-offset . 4)
    (tab-stop-list . '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                       64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
    ;; ����ǥ�Ȥ϶���ʸ���ǹԤ�(TAB�����ɤ������Ѵ�)
    (indent-tabs-mode . nil)
    ;; �����Υ���ǥ������
    (c-offsets-alist . (;; �ؿ��ΰ���list�ΰ�����1����
                        (arglist-intro . c-lineup-arglist-intro-after-paren)
                        ;; �ؿ��ΰ���list���Ĥ����
                        (arglist-close . c-lineup-arglist)
                        ;; �ؿ��ΰ���list�γ�����̤ιԤ˰�����������ΰ�����2���ܰʹ�
                        (arglist-cont-nonempty . c-lineup-arglist-intro-after-paren)
                        ;; Switchʸ���case��٥�
                        (case-label . +)
                        ;; ʸ�η�³�����
                        (statement-cont . c-lineup-math)
                        ;; ���̤�����
                        (brace-list-intro . c-lineup-arglist-intro-after-paren)
                        ;; �Ԥ��������̤ǻϤޤ�Ȥ���enum��list����Ū����ν����list��2���ܰʹߤ�entry
                        (brace-entry-open . 0)
                        ;; Enum��list����Ū����ν����list�γ�������
                        (brace-list-open . 0)
                        ;; Enum��list����Ū����ν����list���Ĥ�����
                        (brace-list-close . 0);c-lineup-arglist-intro-after-paren)
                        ;; Enum��list����Ū����ν����list��entry
                        (brace-list-intro  . 4)
                        ;; ��ʬʸ�γ�������(for, while��������)
                        (substatement-open . 0)
                        ;; ̾�������������
                        (innamespace . 0)
                        ;; ��������block�������(extern��)
                        (inextern-lang . 0)
                        ;; �̾�Υ�٥�(goto��)
                        (label . 0)
                        ;; class����γ�������
                        (class-open . 0)
                        ;; public, private���Υ�٥�
                        (access-label . -)
                        ;; Class���inline method�γ�������
                        (inline-open . nil)
                        ))
    ;; �������줿;�פʶ���ʸ���Υ���󥻥��������
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
;; �����Υ��ڡ�����ե�������¸���˼�ư���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun delete-trailing-whitespace-before-save ()
;;   (if (eq t pxt-mode) (delete-trailing-whitespace)))
;; (add-hook 'before-save-hook 'delete-trailing-whitespace-before-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �ե�������¸���˥��֤򥹥ڡ������Ѵ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun untabify-before-save ()
;;   (if (eq t pxt-mode) (untabify 1 (point-max))))

;; (add-hook 'before-save-hook 'untabify-before-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab, ���ѥ��ڡ���, �����Υ��ڡ�����Ĵ
;; �񼰴ְ㤤��Ĵ
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
     ;; ����
     ("\t" 0 my-face-tab append)
     ;; ���ѥ��ڡ���
     ("��" 0 my-face-zenkaku-spc append)
     ;; �����Υ��ڡ���,����
     ("[ \t]+$" 0 my-face-spc-at-eol append)
     ;; ;; �����Υ��ڡ���
     ("\\((\s+[-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\ ]+\\)" 0 my-face-format-is-wrong append)
     ("\\([-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\ ]+\s+)\\)" 0 my-face-format-is-wrong append)
     ("\\([-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\\[\\]\ ]+\s+)\\)" 0 my-face-format-is-wrong append)
     ("\\(\"\s+)\\)" 0 my-face-format-is-wrong append)
     ;; ������ɤθ�˥��ڡ���
     ("^\s+\\(switch\\|if\\|else if\\|while\\|for\\|sizeof\\|try\\|catch\\|throw\\|explicit\\)\(" 0 my-face-format-is-wrong append)
     ;; do�θ���{
     ("^\s*do\s*{" 0 my-face-format-is-wrong append)
     ;; else�����̤δ֤Υ��ڡ���
     ("\\(}else{\\|}else\\|else{\\)" 0 my-face-format-is-wrong append)
     ;; )�θ���{
     (")\s*{" 0 my-face-format-is-wrong append)
     ;; return�����̤ǰϤ�ǤϤ����ʤ�
     ("return\s*((*[^()]*)*);" 0 my-face-format-is-wrong append)
     ;; �ץ�ץ��å��ǥ��쥯�ƥ��֤ϥ���ǥ�Ȥ���٤��ǤϤʤ�
     ("^[\s\t]+#\\(include\\|pragma\\|define\\|undef\\|if\\|elsif\\|else\\|ifdef\\|ifndef\\|endif\\|error\\|line\\)\s+[-+*/a-zA-Z0-9_()\s\t]+" 0 my-face-format-is-wrong append)
     ;; #ifdef�ϻȤ�ʤ�
     ("^#ifn?def\s+[-+*/a-zA-Z0-9_()\s\t]+" 0 my-face-not-use-format append)
     ;; #pragma once ��ȤäƤϤ����ʤ�
     ("#pragma once" 0 my-face-format-is-wrong append)
     ;; goto�Ϥʤ�٤��Ȥ�ʤ��褦�ˤ��ޤ��礦
     ("goto" 0 my-face-format-is-warning append)
     ;; label��class��Ǥ�public:��ʬ����
     ("^\\([^\\(public\\|private\\)]\\):" 0 my-face-format-is-warning append)
     ;; 1��if���Ĥ���̤θ��ϥ��ڡ���
     ;("if ([-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\ \s]+)[-_!~*'a-zA-Z0-9;/?:@&=+$,%#\]" 0 my-face-format-is-wrong append)
     ))
  (font-lock-fontify-buffer)
  ;;����ǥ�ȥ��å�
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent t)
  (c-add-style "robot" indent-style t)
)

(defun cancel-highlight ()
  (interactive)
  (setq font-lock-set-defaults nil)
  (font-lock-set-defaults)
  (font-lock-fontify-buffer)
  ;; ����ǥ�Ȳ��(gnu���᤹)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent nil)
  (c-set-style "gnu")
)

(defun pxt-mode-init ()
  (if (null pxt-mode) (cancel-highlight)
    (rule-highlight)))

(add-hook 'pxt-mode-hook 'pxt-mode-init)

(provide 'indent-style)

;; ���Υե�����˴ְ㤤�����ä��������Ƥ�̵���ˤ��ޤ�
(put 'eval-expression 'disabled nil)
