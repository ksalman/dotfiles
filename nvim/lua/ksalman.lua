require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
}

-- copy and paste from OS clipboard
vim.opt.clipboard = "unnamedplus"
