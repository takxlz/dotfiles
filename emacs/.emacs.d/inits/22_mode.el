;;; 様々なmodeに関する設定とインデントに関する設定


;; 空白（インデント）を一度のバックスペースですべて削除する
(setq c-hungry-delete-key t)



;; タブの表示幅を4に設定（デフォルトは8）
(setq-default tab-width 4)



;; タブの無効化（空白を使用）
(setq-default indent-tabs-mode nil)



;---------------------------------------------------------------------------------------------------------------

;; c-mode
(defun my-c-c++-mode-init ()
  (c-set-style "java")
  (setq c-basic-offset 4) ;オフセット空白4
  (setq tab-width 4))
(add-hook 'c-mode-common-hook 'my-c-c++-mode-init)
;;          ↑がフックされた時    ↑この(自作)関数を呼ぶ


;---------------------------------------------------------------------------------------------------------------
;; web-mode（外部）
(when (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2)
  (setq tab-width 2))
(add-hook 'web-mode-hook 'web-mode-hook)


;---------------------------------------------------------------------------------------------------------------

;; perl-modeをcperl-modeのエイリアスにする
(defalias 'perl-mode 'cperl-mode)

;; cperl-mode
(defun cperl-mode-hook ()
  (setq cperl-indent-level 4) ; インデント幅を4にする
  (cperl-continued-statement-offset 4) ; 継続する文のオフセット
  (cperl-brace-offset -4) ; ブレースのオフセット
  (cperl-label-offset -4) ; lebelのオフセット
  (cperl-indent-parens-as-block t) ; 括弧もブロックとしてインデント
  (cperl-close-paren-offset -4) ; 閉じ括弧のオフセット
  (cperl-tab-always-indent nil) ; 空白をインデントにする
  (cperl-highlight-variables-indiscriminately t) ; スカラを常にハイライト
  
  ;; perl-completionの設定（cperl-modeがフックされた時にrequireする）（外部）
  (when (require 'perl-completion nil t)
    (perl-completion-mode t)
    (when (require 'perl-complete nil t)
      (auto-complete-mode t)
      (setq ac-soures '(ac-source-perl-completion)))))
(add-hook 'cperl-mode-hook 'cperl-mode-hook)

;---------------------------------------------------------------------------------------------------------------






