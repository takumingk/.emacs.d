;;; 13_elscreen.el --- 
;; Copyright (C) 2016  takuming
;; Keywords:

;;; �ץ�ե�����������C-z
(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
;;; ���֤���Ƭ��[X]��ɽ�����ʤ�
(setq elscreen-tab-display-kill-screen nil)
;;; header-line����Ƭ��[<->]��ɽ�����ʤ�
(setq elscreen-tab-display-control nil)
;;; �Хåե�̾���⡼��̾���饿�֤�ɽ�����������Ƥ���ꤹ��(�ǥե��������)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))

