" --------------------------------------------------------------------------------
" dein config

" deinで使用するディレクトリの指定
"let s:dein_dir = expand(g:vimrc_dir . '/bundle')
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand(g:vimrc_dir . '/rc')
    let s:toml_dir = g:rc_dir . '/plugins'
    " let s:toml      = g:rc_dir . '/dein.toml'
    " let s:lazy_toml = g:rc_dir . '/deinlazy.toml'

    " TOML を読み込み、キャッシュしておく
    " call dein#load_toml(s:toml,      {'lazy': 0})
    " call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " no lazy plugins
    call dein#load_toml(s:toml_dir . '/on/' . 'airblade@vim-gitgutter.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'itchyny@lightline.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'itchyny@vim-parenmatch.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'joshdick@onedark.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'kana@vim-operator-user.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'kana@vim-submode.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'LeafCage@foldCC.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'markonm@traces.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'prabirshrestha@async.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'prabirshrestha@asyncomplete-lsp.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'prabirshrestha@asyncomplete.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'prabirshrestha@vim-lsp.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'Shougo@context_filetype.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'Shougo@dein.vim.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'tpope@vim-fugitive.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'tpope@vim-repeat.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'tpope@vim-surround.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'w0ng@vim-hybrid.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/on/' . 'Yggdroot@indentline.toml', {'lazy': 0})

    " lazy plugins
    call dein#load_toml(s:toml_dir . '/lazy/' . 'cespare@vim-toml.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'dhruvasagar@vim-table-mode.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'gorodinskiy@vim-coloresque.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'junegunn@vim-easy-align.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'reireias@vim-cheatsheet.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'roxma@nvim-yarp.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'roxma@vim-hug-neovim-rpc.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'severin-lemaignan@vim-minimap.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'Shougo@defx.nvim.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'Shougo@denite.nvim.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'Shougo@neomru.vim.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'Shougo@neoyank.vim.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'tomtom@tcomment_vim.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'vim-python@python-syntax.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/lazy/' . 'w0rp@ale.toml', {'lazy': 1})
    " call dein#load_toml(s:toml_dir . '/lazy/' . 'plasticboy@vim-markdown.toml', {'lazy': 1})
    " call dein#load_toml(s:toml_dir . '/lazy/' . 'tyry@open-browser.vim.toml', {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif


" ----------------------------------------------------------------------
" deinの後にすべき設定:

syntax on
filetype plugin indent on
