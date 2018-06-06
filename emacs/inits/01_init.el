;;; 環境の設定など

;;C-x,C-f の find-file のdefault directoryを "~/" にする
(setq default-directory "~/")
(setq command-line-default-directory "~/")



;; Macの場合のファイル名の設定
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))



;; Windowsの場合のファイル名の設定
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))



;; バックアップファイルとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))
(setq auto-save-list-file-prefix "~/.emacs.d/backups/")



;; オートセーブファイル作成までのタイプ数を100タイプに変更（デフォルトは300）
(setq auto-save-interval 100)

