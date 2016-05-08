;;; 15_helm.el --- 

;; Copyright (C) 2016  takuming

;; Keywords:
(require 'helm-config)
(helm-mode +1)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x r") 'helm-recentf)
