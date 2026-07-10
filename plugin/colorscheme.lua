vim.pack.add({ "https://github.com/gbprod/nord.nvim" })
vim.cmd("colorscheme nord")

vim.api.nvim_set_hl(0, "TermErrorLocation", { fg = "#bf616a", underline = true })
-- src/main.zig:12:25
vim.fn.matchadd("TermErrorLocation", "[a-zA-Z0-9./-]*:[0-9]*:[0-9]*")
