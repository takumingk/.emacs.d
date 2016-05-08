;;================================================================================
;; popwin.el
;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;; http://pastelwill.jp/wiki/doku.php?id=emacs:init.el ;; 設定
;;================================================================================
(require 'popwin)
(setq special-display-function 'popwin:special-display-popup-window)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 20)
; for popup anything
(setq anything-samewindow nil)
(push '("*helm*" :height 30) popwin:special-display-config)
;(delete '("*compilation*" :noselect t) popwin:special-display-config)
;(require 'popwin-yatex)
;(push '("*YaTeX-typesetting*") popwin:special-display-config)
