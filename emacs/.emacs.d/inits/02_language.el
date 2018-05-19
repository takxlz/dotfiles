;; 環境を日本語にする

; Windowsの場合
(when (eq system-type 'windows-nt)
  (set-locale-environment nil)
  (set-language-environment "Japanese")
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (prefer-coding-system 'utf-8))


; linuxの場合
(when (eq system-type 'gnu/linux)
  (when (require 'mozc nil t)
    (set-locale-environment nil)
    (set-language-environment "Japanese")
    (setq default-input-method "japanese-mozc")
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-buffer-file-coding-system 'utf-8)
    (setq default-buffer-file-coding-system 'utf-8)
    (set-default-coding-systems 'utf-8)
    (prefer-coding-system 'utf-8)))


