
;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
     (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
             (normal-top-level-add-subdirs-to-load-path))))))

;; ディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "inits" "public_repos")



;; package.elの設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))



;; init-loaderの設定
(when (require 'init-loader nil t)
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load "~/.emacs.d/inits"))


