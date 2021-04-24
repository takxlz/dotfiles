
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {
            'vue',
        }
    },
    indent = {
        enable = false,
    },
    ensure_installed = 'maintained'
}
EOF
