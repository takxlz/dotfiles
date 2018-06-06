;;; 拡張機能の設定

;; auto-installの設定
;(when (require 'auto-install nil t)
;  ;; インストールディレクトリを設定する（デフォルトは.emacs.d/auto-install/）
;  (setq auto-install-directory "~/.emacs.d/elisp/")
;  ;; EmacsWikiに登録されているelispの名前を取得する
;  (auto-install-update-emacswiki-package-name t)
;  ;; 必要であればプロキシの設定を行う
;  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
;  ;; install-elispの関数を利用可能にする
;  (auto-install-compatibility-setup))



;; redo+の設定
(when (require 'redo+ nil t))



;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB")  'auto-complete)
  (ac-config-default))



;; color-moccurの設定
(when (require 'color-moccur nil t)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))



;; moccur-editの設定
(when (require 'moccur-edit nil t))



;; wgrepの設定
(when (require 'wgrep nil t))



;; undohistの設定
(when (require 'undohist nil t)
  (undohist-initialize))



;; undo-treeの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))



;; point-undoの設定
(when (require 'point-undo nil t))



;; elscreenの設定
(setq elscreen-prefix-key (kbd "C-@"))
(when (require 'elscreen nil t)
  (elscreen-start))



;; direxの設定
(when (require 'direx nil t)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory))



;; key-chordの設定
(when (require 'key-chord nil t)
  ;; 許容範囲時間
  (setq key-chord-two-keys-delay 0.05)
  (key-chord-mode 1))



;; space-chordの設定
(when (require 'space-chord nil t)
  ;; 許容範囲時間
  (setq space-chord-delay 0.05))



