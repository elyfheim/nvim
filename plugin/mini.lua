vim.pack.add({ "https://github.com/nvim-mini/mini.files" })
vim.pack.add({ "https://github.com/nvim-mini/mini.ai" })
require("mini.ai").setup({ n_lines = 500 })
local files = require("mini.files")
files.setup({
	mappings = {
		close = "<leader>w",
	},
	options = {
		use_as_default_explorer = false,
	},
})
vim.keymap.set("n", "<leader>w", function()
	files.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini.files" })
