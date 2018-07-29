" プラグインのインストール

" ------------------------------------------------------------
" vim-plug
call plug#begin(expand(g:vim_dir . '/_plugged'))

if has('unix') | Plug Shougo/vimproc.vim', { 'do': 'make' } | endif
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'on': 'Test' }
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFilerExplorer' }
Plug 'Shougo/vimshell.vim', { 'on': 'VimShell' }
Plug 'kana/vim-submode'
Plug 'itchyny/vim-parenmatch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentline'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'LeafCage/foldCC.vim'
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'severin-lemaignan/vim-minimap', { 'on': 'Minimap' }
Plug 'plasticboy/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'kannokanno/previm', { 'for': ['md', 'markdown'] }
Plug 'tyru/open-browser.vim', { 'for': ['md', 'markdown'] }
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode', { 'for': ['md', 'markdown'] }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'takxlz/test'
call plug#end()



