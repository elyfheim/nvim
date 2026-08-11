vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("i", "<M-BS>", "<C-W>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", "<cmd>:vsplit<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>:split<CR>")
vim.keymap.set("n", "<leader>a", "GVgg")
vim.keymap.set("v", "p", "P", { noremap = true })
vim.keymap.set("n", "<leader>bd", function()
	pcall(vim.cmd, "bdelete! " .. vim.api.nvim_get_current_buf())
end)
vim.keymap.set("n", "<leader>bo", function()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if b ~= current_buf and vim.bo[b].buftype ~= "terminal" then
			pcall(vim.cmd, "bdelete " .. b)
		end
	end
end)
vim.keymap.set("n", "dd", function()
	if vim.fn.getline("."):match("^%s*$") then
		return '"_dd'
	end
	return "dd"
end, { expr = true })
