" [keymap]
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> [dap]b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> [dap]B :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> [dab]r :lua require'dap'.repl.open()<CR>
nnoremap <silent> [dap]l :lua require'dap'.run_last()<CR>
nnoremap <silent> [dap]v :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <silent> [dap]V :lua require'dap.ui.variables'.visual_hover()<CR>

" [dapui]
lua <<EOF
require("dapui").setup()
EOF


" [deno]
lua <<EOF
local dap = require('dap')
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/tmp/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.typescript = {
  {
    type = 'node2',
    name = 'Deno Launch',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    console = 'integratedTerminal',
    runtimeExecutable = 'deno',
    runtimeArgs = {'run', '--inspect-brk', '--allow-all', '${file}'},
    port = 9229,
  },
}
EOF

