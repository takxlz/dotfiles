
((digest . "6e63dd01f69e1974281635ed9989815b") (undo-list nil (nil rear-nonsticky nil 803 . 804) (nil fontified nil 803 . 804) (nil fontified nil 773 . 803) (nil fontified nil 732 . 773) (nil fontified nil 729 . 732) (nil fontified nil 724 . 729) (nil fontified nil 703 . 724) (nil fontified nil 663 . 703) (nil fontified nil 642 . 663) (nil fontified nil 622 . 642) (nil fontified nil 618 . 622) (nil fontified nil 569 . 618) (nil fontified nil 548 . 569) (nil fontified nil 547 . 548) (nil fontified nil 544 . 547) (nil fontified nil 525 . 544) (nil fontified nil 488 . 525) (nil fontified nil 442 . 488) (nil fontified nil 439 . 442) (nil fontified nil 334 . 439) (nil fontified nil 330 . 334) (nil fontified nil 329 . 330) (nil fontified nil 309 . 329) (nil fontified nil 306 . 309) (nil fontified nil 216 . 306) (nil fontified nil 203 . 216) (nil fontified nil 201 . 203) (nil fontified nil 194 . 201) (nil fontified nil 165 . 194) (nil fontified nil 161 . 165) (nil fontified nil 160 . 161) (nil fontified nil 144 . 160) (nil fontified nil 141 . 144) (nil fontified nil 136 . 141) (nil fontified nil 132 . 136) (nil fontified nil 93 . 132) (nil fontified nil 89 . 93) (nil fontified nil 65 . 89) (nil fontified nil 16 . 65) (nil fontified nil 14 . 16) (nil fontified nil 13 . 14) (nil fontified nil 5 . 13) (nil fontified nil 1 . 5) (1 . 804) nil (";;; \212\253\202̐ݒ\350\202Ȃ\307

;;C-x,C-f \202\314 find-file \202\314default directory\202\360 \"~/\" \202ɂ\267\202\351
(setq default-directory \"~/\")
(setq command-line-default-directory \"~/\")



;; Mac\202̏ꍇ\202̃t\203@\203C\203\213\226\274\202̐ݒ\350
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))



;; Windows\202̏ꍇ\202̃t\203@\203C\203\213\226\274\202̐ݒ\350
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))



;; \203o\203b\203N\203A\203b\203v\203t\203@\203C\203\213\202ƃI\201[\203g\203Z\201[\203u\203t\203@\203C\203\213\202\360~/.emacs.d/backups/\202֏W\202߂\351
(add-to-list 'backup-directory-alist
             (cons \".\" \"~/.emacs.d/backups/\"))
(setq auto-save-file-name-transforms
      `((\".*\" ,(expand-file-name \"~/.emacs.d/backups/\") t)))
(setq auto-save-list-file-prefix \"~/.emacs.d/backups/\")



;; \203I\201[\203g\203Z\201[\203u\203t\203@\203C\203\213\215쐬\202܂ł̃^\203C\203v\220\224\202\360100\203^\203C\203v\202ɕύX\201i\203f\203t\203H\203\213\203g\202\315300\201j
(setq auto-save-interval 100)

" . 1) ((marker . 1) . -4) ((marker . 1) . -873) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker . 1) . -873) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker . 1) . -872) ((marker . 305) . -15) ((marker . 305) . -15) ((marker . 306) . -16) ((marker . 306) . -16) ((marker . 140) . -72) ((marker . 140) . -72) ((marker . 141) . -102) ((marker . 141) . -102) ((marker . 160) . -145) ((marker . 160) . -145) ((marker . 191) . -146) ((marker . 191) . -146) ((marker . 218) . -147) ((marker . 218) . -147) ((marker . 488) . -148) ((marker . 488) . -148) ((marker . 439) . -173) ((marker . 439) . -173) ((marker . 438) . -204) ((marker . 438) . -204) ((marker . 437) . -231) ((marker . 437) . -231) ((marker . 436) . -274) ((marker . 436) . -274) ((marker . 398) . -316) ((marker . 398) . -316) ((marker . 359) . -317) ((marker . 359) . -317) ((marker . 329) . -318) ((marker . 329) . -318) ((marker) . -319) ((marker) . -319) ((marker) . -348) ((marker) . -348) ((marker) . -378) ((marker) . -378) ((marker) . -417) ((marker) . -417) ((marker) . -455) ((marker) . -455) ((marker) . -456) ((marker) . -456) ((marker) . -457) ((marker) . -457) ((marker) . -458) ((marker) . -458) ((marker) . -530) ((marker) . -530) ((marker) . -567) ((marker) . -567) ((marker) . -614) ((marker) . -614) ((marker) . -651) ((marker) . -651) ((marker) . -712) ((marker) . -712) ((marker) . -768) ((marker) . -768) ((marker) . -769) ((marker) . -769) ((marker) . -770) ((marker) . -770) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker . 803) . -872) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker* . 804) . 873) ((marker . 1) . -4) ((marker . 1) . -4) ((marker) . -873) ((marker) . -873) (t 22542 7715 647031 375000) nil (5 . 874) ("環境の設定など

;;C-x,C-f の find-file のdefault directoryを \"~/\" にする
(setq default-directory \"~/\")
(setq command-line-default-directory \"~/\")



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
             (cons \".\" \"~/.emacs.d/backups/\"))
(setq auto-save-file-name-transforms
      `((\".*\" ,(expand-file-name \"~/.emacs.d/backups/\") t)))
(setq auto-save-list-file-prefix \"~/.emacs.d/backups/\")



;; オートセーブファイル作成までのタイプ数を100タイプに変更（デフォルトは300）
(setq auto-save-interval 100)

" . 5) ((marker . 1) . -798) ((marker) . -8) ((marker) . -8) ((marker) . -9) ((marker) . -9) ((marker) . -60) ((marker) . -60) ((marker) . -90) ((marker) . -90) ((marker) . -133) ((marker) . -133) ((marker) . -134) ((marker) . -134) ((marker) . -135) ((marker) . -135) ((marker) . -136) ((marker) . -136) ((marker) . -155) ((marker) . -155) ((marker) . -186) ((marker) . -186) ((marker) . -213) ((marker) . -213) ((marker) . -256) ((marker) . -256) ((marker) . -298) ((marker) . -298) ((marker) . -299) ((marker) . -299) ((marker) . -300) ((marker) . -300) ((marker) . -301) ((marker) . -301) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker) . -324) ((marker) . -324) ((marker) . -354) ((marker) . -354) ((marker) . -393) ((marker) . -393) ((marker) . -431) ((marker) . -431) ((marker) . -432) ((marker) . -432) ((marker) . -433) ((marker) . -433) ((marker) . -434) ((marker) . -434) ((marker) . -483) ((marker) . -483) ((marker) . -520) ((marker) . -520) ((marker) . -567) ((marker) . -567) ((marker) . -604) ((marker) . -604) ((marker) . -665) ((marker) . -665) ((marker) . -721) ((marker) . -721) ((marker) . -722) ((marker) . -722) ((marker) . -723) ((marker) . -723) ((marker) . -724) ((marker) . -724) ((marker) . -768) ((marker) . -768) ((marker) . -798) ((marker) . -798) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) ((marker . 1) . -799) (t 22542 7715 647031 375000) nil (669 . 670) nil ("
" . -669) ((marker) . -1) ((marker) . -1) nil (608 . 615) nil ("
" . -608) ((marker) . -1) ((marker) . -1) nil (" " . -609) nil (" " . -610) nil (" " . -611) nil (" " . -612) ("	" . 613) ((marker) . -1) (609 . 613) 610 nil (" " . -610) nil (" " . -611) nil (571 . 572) nil ("
" . -571) ((marker) . -1) ((marker) . -1) nil (524 . 538) nil ("
" . -524) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -525) ((marker) . -1) ((marker) . -1) nil (" " . -526) ((marker) . -1) ((marker) . -1) nil (" " . -527) ((marker) . -1) ((marker) . -1) nil (" " . -528) ((marker) . -1) ((marker) . -1) ("	" . 529) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) (525 . 529) 526 nil (" " . -526) ((marker) . -1) ((marker) . -1) nil (" " . -527) ((marker) . -1) ((marker) . -1) nil (" " . -528) ((marker) . -1) ((marker) . -1) nil (" " . -529) ((marker) . -1) ((marker) . -1) ("	" . 530) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) (526 . 530) 527 nil (" " . -527) ((marker) . -1) ((marker) . -1) nil (" " . -528) ((marker) . -1) ((marker) . -1) nil (" " . -529) ((marker) . -1) ((marker) . -1) nil (" " . -530) ((marker) . -1) ((marker) . -1) ("	" . 531) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) (527 . 531) 528 nil (" " . -528) ((marker) . -1) ((marker) . -1) (t 22422 12734 806850 643000)))
