
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {
            'vue',
        }
    },
    indent = {
        enable = true,
    },
    ensure_installed = 'maintained'
}
EOF
