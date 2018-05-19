
((digest . "c6c132c5589321c9635511cfc8e1fddd") (undo-list nil (nil rear-nonsticky nil 1675 . 1676) (nil fontified nil 1025 . 1676) (nil fontified nil 1016 . 1025) (nil fontified nil 1011 . 1016) (nil fontified nil 1009 . 1011) (nil fontified nil 1002 . 1009) (nil fontified nil 1000 . 1002) (nil fontified nil 996 . 1000) (nil fontified nil 995 . 996) (nil fontified nil 986 . 995) (nil fontified nil 983 . 986) (nil fontified nil 971 . 983) (nil fontified nil 960 . 971) (nil fontified nil 958 . 960) (nil fontified nil 951 . 958) (nil fontified nil 949 . 951) (nil fontified nil 945 . 949) (nil fontified nil 944 . 945) (nil fontified nil 929 . 944) (nil fontified nil 926 . 929) (nil fontified nil 920 . 926) (nil fontified nil 912 . 920) (nil fontified nil 871 . 912) (nil fontified nil 858 . 871) (nil fontified nil 819 . 858) (nil fontified nil 799 . 819) (nil fontified nil 796 . 799) (nil fontified nil 765 . 796) (nil fontified nil 751 . 765) (nil fontified nil 748 . 751) (nil fontified nil 738 . 748) (nil fontified nil 726 . 738) (nil fontified nil 724 . 726) (nil fontified nil 717 . 724) (nil fontified nil 715 . 717) (nil fontified nil 711 . 715) (nil fontified nil 710 . 711) (nil fontified nil 694 . 710) (nil fontified nil 691 . 694) (nil fontified nil 646 . 691) (nil fontified nil 639 . 646) (nil fontified nil 606 . 639) (nil fontified nil 580 . 606) (nil fontified nil 523 . 580) (nil fontified nil 515 . 523) (nil fontified nil 495 . 515) (nil fontified nil 493 . 495) (nil fontified nil 486 . 493) (nil fontified nil 484 . 486) (nil fontified nil 480 . 484) (nil fontified nil 479 . 480) (nil fontified nil 462 . 479) (nil fontified nil 459 . 462) (nil fontified nil 447 . 459) (nil fontified nil 442 . 447) (nil fontified nil 440 . 442) (nil fontified nil 433 . 440) (nil fontified nil 431 . 433) (nil fontified nil 427 . 431) (nil fontified nil 426 . 427) (nil fontified nil 417 . 426) (nil fontified nil 414 . 417) (nil fontified nil 373 . 414) (nil fontified nil 348 . 373) (nil fontified nil 345 . 348) (nil fontified nil 343 . 345) (nil fontified nil 286 . 343) (nil fontified nil 283 . 286) (nil fontified nil 281 . 283) (nil fontified nil 264 . 281) (nil fontified nil 261 . 264) (nil fontified nil 210 . 261) (nil fontified nil 179 . 210) (nil fontified nil 176 . 179) (nil fontified nil 172 . 176) (nil fontified nil 153 . 172) (nil fontified nil 122 . 153) (nil fontified nil 74 . 122) (nil fontified nil 71 . 74) (nil fontified nil 61 . 71) (nil fontified nil 49 . 61) (nil fontified nil 47 . 49) (nil fontified nil 40 . 47) (nil fontified nil 38 . 40) (nil fontified nil 34 . 38) (nil fontified nil 33 . 34) (nil fontified nil 17 . 33) (nil fontified nil 14 . 17) (nil fontified nil 13 . 14) (nil fontified nil 5 . 13) (nil fontified nil 1 . 5) (1 . 1676) nil (";;; \212g\222\243\213@\224\\\202̐ݒ\350

;; auto-install\202̐ݒ\350
(when (require 'auto-install nil t)
  ;; \203C\203\223\203X\203g\201[\203\213\203f\203B\203\214\203N\203g\203\212\202\360\220ݒ肷\202\351\201i\203f\203t\203H\203\213\203g\202\315.emacs.d/auto-install/\201j
  (setq auto-install-directory \"~/.emacs.d/elisp/\")
  ;; EmacsWiki\202ɓo\230^\202\263\202\352\202Ă\242\202\351elisp\202̖\274\221O\202\360\216擾\202\267\202\351
  (auto-install-update-emacswiki-package-name t)
  ;; \225K\227v\202ł\240\202\352\202΃v\203\215\203L\203V\202̐ݒ\350\202\360\215s\202\244
  ;; (setq url-proxy-services '((\"http\" . \"localhost:8339\")))
  ;; install-elisp\202̊֐\224\202𗘗p\211\\\202ɂ\267\202\351
  (auto-install-compatibility-setup))



;; redo+\202̐ݒ\350
(when (require 'redo+ nil t))



;; auto-complete\202̐ݒ\350
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               \"~/.emacs.d/elisp/ac-dict\")
  (define-key ac-mode-map (kbd \"M-TAB\")  'auto-complete)
  (ac-config-default))



;; color-moccur\202̐ݒ\350
(when (require 'color-moccur nil t)
  ;; \203X\203y\201[\203X\213\346\220؂\350\202\305AND\214\237\215\365
  (setq moccur-split-word t)
  ;; \203f\203B\203\214\203N\203g\203\212\214\237\215\365\202̂Ƃ\253\217\234\212O\202\267\202\351\203t\203@\203C\203\213
  (add-to-list 'dmoccur-exclusion-mask \"\\\\.DS_Store\")
  (add-to-list 'dmoccur-exclusion-mask \"^#.+#$\"))



;; moccur-edit\202̐ݒ\350
(when (require 'moccur-edit nil t))



;; wgrep\202̐ݒ\350
(when (require 'wgrep nil t))



;; undohist\202̐ݒ\350
(when (require 'undohist nil t)
  (undohist-initialize))



;; undo-tree\202̐ݒ\350
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))



;; point-undo\202̐ݒ\350
(when (require 'point-undo nil t))



;; elscreen\202̐ݒ\350
(setq elscreen-prefix-key (kbd \"C-@\"))
(when (require 'elscreen nil t)
  (elscreen-start))



;; direx\202̐ݒ\350
(when (require 'direx nil t)
(global-set-key (kbd \"C-x C-j\") 'direx:jump-to-directory))



;; key-chord\202̐ݒ\350
(when (require 'key-chord nil t)
  ;; \213\226\227e\224͈͎\236\212\324
  (setq key-chord-two-keys-delay 0.05)
  (key-chord-mode 1))



;; space-chord\202̐ݒ\350
(when (require 'space-chord nil t)
  ;; \213\226\227e\224͈͎\236\212\324
  (setq space-chord-delay 0.05))




" . 1) ((marker . 1) . -4) ((marker . 1) . -1776) ((marker* . 1676) . 1776) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 1) . -4) ((marker . 174) . -17) ((marker . 174) . -17) ((marker . 210) . -18) ((marker . 210) . -18) ((marker . 688) . -38) ((marker . 688) . -38) ((marker . 665) . -74) ((marker . 665) . -74) ((marker . 608) . -149) ((marker . 608) . -149) ((marker . 565) . -201) ((marker . 565) . -201) ((marker . 523) . -248) ((marker . 523) . -248) ((marker . 794) . -297) ((marker . 794) . -297) ((marker . 819) . -331) ((marker . 819) . -331) ((marker . 873) . -393) ((marker . 873) . -393) ((marker . 13) . -427) ((marker . 13) . -427) ((marker . 1) . -465) ((marker . 1) . -465) ((marker) . -466) ((marker) . -466) ((marker) . -467) ((marker) . -467) ((marker) . -468) ((marker) . -468) ((marker) . -481) ((marker) . -481) ((marker) . -511) ((marker) . -511) ((marker) . -512) ((marker) . -512) ((marker) . -513) ((marker) . -513) ((marker) . -514) ((marker) . -514) ((marker) . -535) ((marker) . -535) ((marker) . -579) ((marker) . -579) ((marker) . -621) ((marker) . -621) ((marker) . -664) ((marker) . -664) ((marker) . -721) ((marker) . -721) ((marker) . -744) ((marker) . -744) ((marker) . -745) ((marker) . -745) ((marker) . -746) ((marker) . -746) ((marker) . -747) ((marker) . -747) ((marker* . 1676) . 1776) ((marker . 1) . -4) ((marker . 1676) . -1776) ((marker* . 1676) . 1776) ((marker . 1) . -4) ((marker . 1) . -4) ((marker) . -1776) ((marker) . -1776) (t 22542 3903 470684 322000) nil (5 . 1777) ("拡張機能の設定

;; auto-installの設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定する（デフォルトは.emacs.d/auto-install/）
  (setq auto-install-directory \"~/.emacs.d/elisp/\")
  ;; EmacsWikiに登録されているelispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればプロキシの設定を行う
  ;; (setq url-proxy-services '((\"http\" . \"localhost:8339\")))
  ;; install-elispの関数を利用可能にする
  (auto-install-compatibility-setup))



;; redo+の設定
(when (require 'redo+ nil t))



;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               \"~/.emacs.d/elisp/ac-dict\")
  (define-key ac-mode-map (kbd \"M-TAB\")  'auto-complete)
  (ac-config-default))



;; color-moccurの設定
(when (require 'color-moccur nil t)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask \"\\\\.DS_Store\")
  (add-to-list 'dmoccur-exclusion-mask \"^#.+#$\"))



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
(setq elscreen-prefix-key (kbd \"C-@\"))
(when (require 'elscreen nil t)
  (elscreen-start))



;; direxの設定
(when (require 'direx nil t)
(global-set-key (kbd \"C-x C-j\") 'direx:jump-to-directory))



;; key-chordの設定
(when (require 'key-chord nil t)
  ;; 許容範囲時間
  (setq key-chord-two-keys-delay 0.05)
  (key-chord-mode 1))



;; space-chordの設定
(when (require 'space-chord nil t)
  ;; 許容範囲時間
  (setq space-chord-delay 0.05))




" . 5) ((marker . 1) . -1671) ((marker) . -8) ((marker) . -8) ((marker) . -9) ((marker) . -9) ((marker) . -28) ((marker) . -28) ((marker) . -64) ((marker) . -64) ((marker) . -117) ((marker) . -117) ((marker) . -169) ((marker) . -169) ((marker) . -205) ((marker) . -205) ((marker) . -254) ((marker) . -254) ((marker) . -276) ((marker) . -276) ((marker) . -338) ((marker) . -338) ((marker) . -368) ((marker) . -368) ((marker) . -406) ((marker) . -406) ((marker) . -407) ((marker) . -407) ((marker) . -408) ((marker) . -408) ((marker) . -409) ((marker) . -409) ((marker) . -421) ((marker) . -421) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker) . -451) ((marker) . -451) ((marker) . -452) ((marker) . -452) ((marker) . -453) ((marker) . -453) ((marker) . -454) ((marker) . -454) ((marker) . -474) ((marker) . -474) ((marker) . -518) ((marker) . -518) ((marker) . -560) ((marker) . -560) ((marker) . -603) ((marker) . -603) ((marker) . -660) ((marker) . -660) ((marker) . -683) ((marker) . -683) ((marker) . -684) ((marker) . -684) ((marker) . -685) ((marker) . -685) ((marker) . -686) ((marker) . -686) ((marker) . -705) ((marker) . -705) ((marker) . -741) ((marker) . -741) ((marker) . -760) ((marker) . -760) ((marker) . -789) ((marker) . -789) ((marker) . -814) ((marker) . -814) ((marker) . -868) ((marker) . -868) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) ((marker . 1) . -1671) (t 22542 3903 470684 322000) nil (648 . 664) nil ("'" . -648) nil (633 . 649) nil ("(" . -633) nil ("k" . -634) nil (619 . 635) nil ("y" . -619) nil ("e" . -620) nil (610 . 621) nil (607 . 610) nil (564 . 580) nil ("
" . -564) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -565) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -566) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -567) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -568) ((marker) . -1) ((marker) . -1) ((marker) . -1) ("	" . 569) ((marker) . -1) ((marker) . -1) ((marker) . -1) (565 . 569) 566 nil (" " . -566) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -567) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -568) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -569) ((marker) . -1) ((marker) . -1) ((marker) . -1) ("	" . 570) ((marker) . -1) ((marker) . -1) ((marker) . -1) (566 . 570) 567 nil (" " . -567) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -568) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -569) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -570) ((marker) . -1) ((marker) . -1) ((marker) . -1) ("	" . 571) ((marker) . -1) ((marker) . -1) ((marker) . -1) (567 . 571) 568 nil (" " . -568) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -569) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -570) ((marker) . -1) ((marker) . -1) ((marker) . -1) (t 22542 747 351909 200000) nil (1601 . 1610) ("9))




" . 1601) ((marker) . -3) ((marker) . -4) ((marker) . -4) 1605 nil ("m" . -1604) nil (" " . -1605) nil (1604 . 1606) nil ("m" . -1604) nil (" " . -1605) nil (1604 . 1606) (t 22542 335 36701 94000) nil (1601 . 1602) nil ("1" . -1601) (t 22542 256 987336 475000)))
