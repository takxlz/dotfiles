;; key-chord.elにより、
;; (key-chord-define-global "ab" 'hoge)のように書けば
;; グローバルマップ時でabの同時押しがhogeに割り当てられる

;; space-chord.elにより、
;; (space-chord-define-global "a" 'hoge)のように書けば
;; グローバルマップ時で、スペースとaの同時押しがhogeに割り当てられる


;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)



;; ウィンドウを切り替える （デフォルトはtrans-chars）
(define-key global-map (kbd "C-t") 'other-window)



;; にリドゥを割り当てる
(define-key global-map (kbd "C-'") 'redo)


;; auto-completeを割り当てる
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)



;; occur-by-moccurを割り当てる
(define-key global-map (kbd "M-o") 'occur-by-moccur)



;; point-undo,point-redoを割り当てる
(define-key global-map (kbd "M-[") 'point-undo)
(define-key global-map (kbd "M-]") 'point-redo)




;-------------------------------------------------helm関連--------------------------------------------------------------------------

;; helm-miniを開く
(define-key global-map (kbd "C-c h") 'helm-mini)



;; helm-show-kill-ringを割り当てる（過去の履歴からペーストする）
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)



;; helm-c-moccur-occur-by-moccurを割り当てる
(define-key global-map (kbd "C-M-o") 'helm-c-moccur-occur-by-moccur)



;-----------------------------------------key-chord  space-chordによるキーバインド-----------------------------------------------------
;; 指定した文字数目に飛ぶ
(key-chord-define-global "fj" 'goto-char)
(space-chord-define-global "j" 'goto-char)


;; ウィンドウを移動する  window-move
(key-chord-define-global "wm" 'other-window)


;; カレントウィンドウを削除する  window-delete
(key-chord-define-global "wd" 'delete-window)



;-------------------------------------------マクロ-------------------------------------------------------------

;; 1行を削除するマクロ（自作）
(fset '_kill-line
      "\C-a\C-k\C-p")
; 下の行のようにしてC-dに割り当てていたが、モードによってそのモードの干渉で動作しない場合がある(その場合は、一番下のあたりに書いてある自作マイナーモードで強制的に割り当てる)
;(define-key global-map (kbd "C-d") '_kill-line)


;-------------------------------------------自作マイナーモードによる強制キーバインド-------------------------------------------------------------

;; 自分で設定したキーバインドが他のキーバインドと干渉してしまう場合に、このマイナーモードで強制的に割り当てる
(define-minor-mode overriding-minor-mode
  "強制的にキーを割り当てる"                   ; メッセージ
  t                                                                ; デフォルトで有効にする
  " _Override-key "                                   ; モードラインに表示する文字
  `(
    (,(kbd "C-d") . _kill-line)                      ; 設定するキーバインド(複数ある場合は下の行のように続けて書いていけばいい)
;    (,(kbd "C-t") . _kill-line)
    ))

