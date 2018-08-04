### remote_plugin(neovim)

- pythonなどの外部言語を使用したプラグインを使用する場合は  
 「:call UpdateRemotePlugins」して登録する必要がある．
 
- 「UpdateRemotePlugins」は現在ロードされている外部言語を使用したプラグインを自動で追加するので  
  deinでlazyロードに設定しており読み込まれていない状態で「:call UpdateRemotePlugins」しても登録されない

  - また，「:call UpdateRemotePlugins」すると現在の登録情報を上書きしてしまうので  
    「:call UpdateRemotePlugins」するときは登録したいプラグインを"全て"読み込んだ状態で「:call UpdateRemotePlugins」  
    を実行する必要がある．

  - ↑は面倒なので，tomlで外部言語を使用するプラグインに「hook_post_update = call UpdateRemotePlugins(or dein#remote_plugins)」を記述し  
   「:call dein#update() (or dein#remote_plugins)」する．(外部言語を使用するプラグインのどれか1つに記述するだけでいい)


