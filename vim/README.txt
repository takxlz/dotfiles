# 会社用環境構築

## nodeのインストール





## fzfのバイナリのダウンロード/配置（セキュリティにより手動で実施する必要がある）
  - ダウンロード元: https://github.com/junegunn/fzf-bin/releases/
  - 配置先: ~/.cache/plugged/fzf/bin/
  ※ fzfのバージョンに合ったバイナリを取得すること





## rgのインストール
  - windows環境ではrgが上手く効かなくなるのでshellslashを無効にする（workブランチでは無効済み）





## coc-javaをインストール
  - :CocInstall coc-java

  - jdt.lsのダウンロード/配置（セキュリティにより手動で実施する必要がある）
    - ダウンロード元: https://download.eclipse.org/jdtls/snapshots/?d
    - 配置先: ~/AppData/Local/coc/extension/coc-java-data/server/

  ※ セキュリティと閉域網のため、手動でダウンロードする

