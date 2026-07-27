vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.shell = "fish"
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local term_buf = nil
local term_win = nil

vim.keymap.set("n", "<space>t", function()
	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.api.nvim_win_close(term_win, false)
		term_win = nil
		return
	end

	vim.cmd("botright 20split")

	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		vim.api.nvim_win_set_buf(0, term_buf)
	else
		vim.cmd("terminal fish")
		term_buf = vim.api.nvim_get_current_buf()
	end

	term_win = vim.api.nvim_get_current_win()
end)

vim.keymap.set("n", "<C-m>", function()
	vim.cmd("resize -2")
end)

vim.keymap.set("n", "<C-,>", function()
	vim.cmd("resize +2")
end)

vim.keymap.set("n", "gd", function()
	print("yahallo")
end)
