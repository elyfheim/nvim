vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.shell = "fish"
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local original_term_win = vim.api.nvim_get_current_win()
local term_open = false

vim.keymap.set("n", "<space>t", function()
	if term_open then
		term_open = false
		local wins = vim.api.nvim_list_wins()
		for _, win in ipairs(wins) do
			if win ~= original_term_win then
				vim.api.nvim_win_close(win, false)
			end
		end
	else
		term_open = true
		vim.cmd.vnew()
		vim.cmd("term fish")
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 20)
	end
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
