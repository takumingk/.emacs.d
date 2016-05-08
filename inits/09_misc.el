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
;; ���⡼�ɶ��̥���ǥ������
;; tab �ǤϤʤ� space ��Ȥ�
(setq-default indent-tabs-mode nil)
;; tab ���� 4 ������
(setq-default tab-width 4)

;; �ե��������Ƭ��#!�ǻϤޤ�ե�����ϼ¹Ը���Ĥ�����¸���Ƥ����
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; Ʊ�����Ƥ�����˵�Ͽ���ʤ��褦�ˤ���
(setq history-delete-duplicates t)
