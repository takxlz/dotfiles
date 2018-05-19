;; helmの設定
(when (require 'helm-config nil t)
  (helm-mode 1))



;; helm-descbindsの設定
(when (require 'helm-descbinds nil t)
  (helm-descbinds-mode))



;; helm-c-moccurの設定
(when (require 'helm-c-moccur nil t)
  (setq
   helm-c-moccur-helm-idle-delay 0.1
   helm-c-moccur-higligt-info-line-flag t
   helm-c-moccur-enable-auto-look-flag t
   helm-c-moccur-enable-initial-pattern t))
