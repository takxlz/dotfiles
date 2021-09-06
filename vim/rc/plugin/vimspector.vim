function! GotoWindow(id)
    call win_gotoid(a:id)
    call takxlz#util#toggle_maximize_window()
endfun

" Debugger remaps
" nnoremap [protocol]c :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap [protocol]t :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap [protocol]v :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap [protocol]w :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap [protocol]s :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap [protocol]o :call GotoWindow(g:vimspector_session_windows.output)<CR>

" nnoremap [protocol]e :call vimspector#Reset()<CR>
" nnoremap [protocol]d :call vimspector#Launch()<CR>
" nnoremap [protocol]d<space> :call vimspector#Continue()<CR>
" nnoremap [protocol]B :call vimspector#CleanLineBreakpoint()<CR>

" nmap [protocol]l <Plug>VimspectorStepInto
" nmap [protocol]j <Plug>VimspectorStepOver
" nmap [protocol]k <Plug>VimspectorStepOut
" nmap [protocol]_ <Plug>VimspectorRestart

" nmap [protocol]rc <Plug>VimspectorRunToCursor
" nmap [protocol]b <Plug>VimspectorToggleBreakpoint
" nmap [protocol]cb <Plug>VimspectorToggleConditionalBreakpoint

" let g:vimspector_enable_mapping = 'HUMAN'
nmap <F5>    <Plug>VimspectorContinue
nmap <S-F5>  <Plug>VimspectorStop
nmap <F4>    <Plug>VimspectorRestart
nmap <S-F4>  :<C-u>call vimspector#Reset()<CR>
nmap <F9>    <Plug>VimspectorToggleBreakpoint
nmap <S-F9>  <Plug>VimspectorAddFunctionBreadkpoint
nmap <F10>   <Plug>VimspectorStepOver
nmap <F11>   <Plug>VimspectorStepInto
nmap <S-F11> <Plug>VimspectorStepOut
