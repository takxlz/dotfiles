
((digest . "2f8c989eb16297fdd5fef43b70bfff51") (undo-list nil (nil rear-nonsticky nil 1799 . 1800) (nil fontified nil 1043 . 1800) (nil fontified nil 907 . 1043) (nil fontified nil 898 . 907) (nil fontified nil 896 . 898) (nil fontified nil 856 . 896) (nil fontified nil 847 . 856) (nil fontified nil 845 . 847) (nil fontified nil 805 . 845) (nil fontified nil 800 . 805) (nil fontified nil 798 . 800) (nil fontified nil 758 . 798) (nil fontified nil 755 . 758) (nil fontified nil 753 . 755) (nil fontified nil 713 . 753) (nil fontified nil 710 . 713) (nil fontified nil 708 . 710) (nil fontified nil 668 . 708) (nil fontified nil 659 . 668) (nil fontified nil 657 . 659) (nil fontified nil 615 . 657) (nil fontified nil 605 . 615) (nil fontified nil 603 . 605) (nil fontified nil 596 . 603) (nil fontified nil 595 . 596) (nil fontified nil 581 . 595) (nil fontified nil 578 . 581) (nil fontified nil 575 . 578) (nil fontified nil 559 . 575) (nil fontified nil 557 . 559) (nil fontified nil 526 . 557) (nil fontified nil 514 . 526) (nil fontified nil 512 . 514) (nil fontified nil 499 . 512) (nil fontified nil 487 . 499) (nil fontified nil 484 . 487) (nil fontified nil 430 . 484) (nil fontified nil 397 . 430) (nil fontified nil 394 . 397) (nil fontified nil 369 . 394) (nil fontified nil 366 . 369) (nil fontified nil 254 . 366) (nil fontified nil 249 . 254) (nil fontified nil 247 . 249) (nil fontified nil 240 . 247) (nil fontified nil 238 . 240) (nil fontified nil 234 . 238) (nil fontified nil 230 . 234) (nil fontified nil 213 . 230) (nil fontified nil 207 . 213) (nil fontified nil 191 . 207) (nil fontified nil 190 . 191) (nil fontified nil 185 . 190) (nil fontified nil 184 . 185) (nil fontified nil 156 . 184) (nil fontified nil 153 . 156) (nil fontified nil 116 . 153) (nil fontified nil 104 . 116) (nil fontified nil 101 . 104) (nil fontified nil 65 . 101) (nil fontified nil 46 . 65) (nil fontified nil 43 . 46) (nil fontified nil 16 . 43) (nil fontified nil 8 . 16) (nil fontified nil 5 . 8) (nil fontified nil 2 . 5) (nil fontified nil 1 . 2) (1 . 1800) nil ("
;; C-k\202ōs\221S\221̂\360\215폜
(setq kill-whole-line t)


;; \215s\202̍Ō\343\202ɗ\210\202\275\202\347\201A\220V\202\265\202\242\215s\202\360\215\354\202\347\202Ȃ\242
(setq next-line-add-newlines nil)


;; \203G\203\211\201[\211\271\202\360\202Ȃ\347\202Ȃ\255\202\267\202\351
(setq ring-bell-function 'ignore)



;; emacs-lisp-mode-hook\227p\202̊֐\224\202\360\222\350\213`
(defun elisp-mode-hooks ()
  \"lisp-mode-hooks\"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
;; emacs-lisp-mode\202̃t\203b\203N\202\360\203Z\203b\203g\202\265
;; \203J\201[\203\\\203\213\210ʒu\202\314lisp\212֐\224\202\342\225ϐ\224\202̏\356\225\361\202\360\203G\203R\201[\203G\203\212\203A\202֕\\\216\246\202\263\202\271\202\351
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)



;; cua-mode\202̐ݒ\350
(cua-mode t) ; cua-mode\202\360\203I\203\223
(setq cua-enable-cua-keys nil) ; cua\203L\201[\203o\203C\203\223\203h\202𖳌\370\202ɂ\267\202\351



;; \221S\212p\203X\203y\201[\203X\202ƃ^\203u\202\360\211\213\211\273
(require 'whitespace)
(setq whitespace-style '(face           ; face\202ŉ\213\211\273
                         trailing       ; \215s\226\226
                         tabs           ; \203^\203u
                         spaces         ; \203X\203y\201[\203X
                         empty          ; \220擪/\226\226\224\366\202̋\363\215s
                         space-mark     ; \225\\\216\246\202̃}\203b\203s\203\223\203O
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\\u3000 [?\\u25a1])
        (tab-mark ?\\t [?\\u00BB ?\\t] [?\\\\ ?\\t])))
;; \203X\203y\201[\203X\202͑S\212p\202݂̂\360\211\213\211\273
(setq whitespace-space-regexp \"\\\\(\\u3000+\\\\)\")
(global-whitespace-mode 1)
(defvar my/bg-color \"#232323\")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground \"DeepPink\"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground \"LightSkyBlue\"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground \"GreenYellow\"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

" . 1) ((marker . 1) . -1914) ((marker* . 1800) . 1914) ((marker . 1) . -7) ((marker . 577) . -1) ((marker . 577) . -1) ((marker . 576) . -18) ((marker . 576) . -18) ((marker . 575) . -43) ((marker . 575) . -43) ((marker . 526) . -44) ((marker . 526) . -44) ((marker . 499) . -45) ((marker . 499) . -45) ((marker . 150) . -81) ((marker . 150) . -81) ((marker . 151) . -115) ((marker . 151) . -115) ((marker . 152) . -116) ((marker . 152) . -116) ((marker . 153) . -117) ((marker . 153) . -117) ((marker . 184) . -141) ((marker . 184) . -141) ((marker . 65) . -175) ((marker . 65) . -175) ((marker . 99) . -176) ((marker . 99) . -176) ((marker . 100) . -177) ((marker . 100) . -177) ((marker . 101) . -178) ((marker . 101) . -178) ((marker . 116) . -214) ((marker . 116) . -214) ((marker) . -241) ((marker) . -241) ((marker) . -261) ((marker) . -261) ((marker) . -292) ((marker) . -292) ((marker) . -324) ((marker) . -324) ((marker) . -369) ((marker) . -369) ((marker) . -396) ((marker) . -396) ((marker) . -432) ((marker) . -432) ((marker) . -491) ((marker) . -491) ((marker) . -542) ((marker) . -542) ((marker) . -543) ((marker) . -543) ((marker) . -544) ((marker) . -544) ((marker) . -545) ((marker) . -545) ((marker) . -561) ((marker) . -561) ((marker) . -591) ((marker) . -591) ((marker) . -648) ((marker) . -648) ((marker) . -649) ((marker) . -649) ((marker) . -650) ((marker) . -650) ((marker* . 1800) . 1914) ((marker . 1) . -7) ((marker . 1800) . -1914) ((marker* . 1800) . 1914) ((marker . 1) . -7) ((marker* . 1800) . 1914) ((marker . 1) . -7) ((marker* . 1800) . 1914) ((marker . 1) . -7) ((marker* . 1800) . 1914) ((marker . 1) . -7) ((marker . 1) . -7) ((marker) . -1914) ((marker) . -1914) (t 22542 7850 573480 941000) nil (8 . 1915) ("で行全体を削除
(setq kill-whole-line t)


;; 行の最後に来たら、新しい行を作らない
(setq next-line-add-newlines nil)


;; エラー音をならなくする
(setq ring-bell-function 'ignore)



;; emacs-lisp-mode-hook用の関数を定義
(defun elisp-mode-hooks ()
  \"lisp-mode-hooks\"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
;; emacs-lisp-modeのフックをセットし
;; カーソル位置のlisp関数や変数の情報をエコーエリアへ表示させる
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)



;; cua-modeの設定
(cua-mode t) ; cua-modeをオン
(setq cua-enable-cua-keys nil) ; cuaキーバインドを無効にする



;; 全角スペースとタブを可視化
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\\u3000 [?\\u25a1])
        (tab-mark ?\\t [?\\u00BB ?\\t] [?\\\\ ?\\t])))
;; スペースは全角のみを可視化
(setq whitespace-space-regexp \"\\\\(\\u3000+\\\\)\")
(global-whitespace-mode 1)
(defvar my/bg-color \"#232323\")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground \"DeepPink\"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground \"LightSkyBlue\"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground \"GreenYellow\"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

" . 8) ((marker . 1) . -1792) ((marker . 1) . -1792) (t 22542 7850 573480 941000) nil (338 . 343) nil ("
" . -338) ((marker) . -1) ((marker) . -1) nil (" " . -339) nil (" " . -340) nil (" " . -341) nil (" " . -342) ("	" . 343) (339 . 343) 340 nil (293 . 298) nil ("
" . -293) ((marker) . -1) ((marker) . -1) nil (" " . -294) nil (" " . -295) nil (" " . -296) nil (" " . -297) nil (293 . 298) nil ("
" . -293) ((marker) . -1) ((marker) . -1) nil (" " . -294) nil (" " . -295) nil (" " . -296) nil (" " . -297) ("	" . 298) (294 . 298) 295 nil (261 . 266) nil ("
" . -261) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -262) ((marker) . -1) ((marker) . -1) nil (" " . -263) ((marker) . -1) ((marker) . -1) nil (" " . -264) ((marker) . -1) ((marker) . -1) nil (" " . -265) ((marker) . -1) ((marker) . -1) ("	" . 266) ((marker) . -1) ((marker) . -1) (262 . 266) 263 (t 22422 12734 806850 643000)))
