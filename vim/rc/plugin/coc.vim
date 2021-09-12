" 定義へ移動
nnoremap <silent> [lsp]d :<C-u>call CocActionAsync('jumpDefinition', 'tab drop')<CR>
nnoremap <silent> [lsp]D :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>

" 型定義へ移動
nnoremap <silent> [lsp]t :<C-u>call CocActionAsync('jumpTypeDefinition', 'tab drop')<CR>
nnoremap <silent> [lsp]T :<C-u>call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>

" 実装へ移動
nnoremap <silent> [lsp]i :<C-u>call CocActionAsync('jumpImplementation', 'tab drop')<CR>
nnoremap <silent> [lsp]I :<C-u>call CocActionAsync('jumpImplementation', 'vsplit')<CR>

" diagnostic
nnoremap [lsp], :<C-u>CocList diagnostics<CR>
nnoremap [lsp]k <Plug>(coc-diagnostic-prev)
nnoremap [lsp]j <Plug>(coc-diagnostic-next)
nnoremap <silent> [lsp]p <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> [lsp]n <Plug>(coc-diagnostic-next-error)

" 参照へ移動
nnoremap [lsp]r <Plug>(coc-references)

" リネーム
nnoremap [lsp]R <Plug>(coc-rename)

" 型を表示
nnoremap gh :<C-u>call CocActionAsync('doHover')<CR>

" リスタート
nnoremap <silent> [lsp]<space>l :<C-u>CocRestart<CR>
