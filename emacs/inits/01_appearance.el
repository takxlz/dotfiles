;;; appearance

;; テーマとフォントの設定
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "outline" :slant normal :weight normal :height 140 :width normal)))))



;; ウィンドウサイズを最大化する
(set-frame-parameter nil 'fullscreen 'maximized)



;; モードラインに行番号を表示する
(global-linum-mode t)



;; モードラインに列番号を表示する
(column-number-mode t)



;; モードラインにファイルサイズを表示する
(size-indication-mode t)



;; モードラインに時計を表示する
(setq display-time-string-forms
      '((format "  %s/%s (%s) %s:%s"
                month day dayname
                24-hours minutes
                )))
(display-time-mode t)



;; モードラインにバッテリー残量を表示する
(display-battery-mode t)



;; モードラインに選択範囲の行数・文字数を表示する
(defun count-lines-and-chars ()
  (if mark-active
      (format " [(%d)lines, (%d)chars]  "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))



;; 起動時のメッセージを表示しない
(setq inhibit-startup-message t)



;; モードラインに改行コードを表示する
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")



;; フレームにカレントフィルのパスとユーザ名を表示する
(setq frame-title-format
      (format "   %%f   -   Emacs@%s" (system-name)))



;; メニューバーを表示しない
;(menu-bar-mode -1)



;; ツールバーを表示しない
;(tool-bar-mode -1)



;; 対応する括弧を強調表示する
(show-paren-mode t)
(set-face-background 'show-paren-match-face "Blue") ; 青色に強調表示する

