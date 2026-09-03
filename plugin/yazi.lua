vim.pack.add({ "https://github.com/mikavilpas/yazi.nvim" })

vim.keymap.set("n", "<leader>w", function()
	require("yazi").yazi()
end)
