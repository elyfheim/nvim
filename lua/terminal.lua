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
local job_id = 0

function toggle_terminal()
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
		job_id = vim.bo.channel
	end

	term_win = vim.api.nvim_get_current_win()
end

vim.keymap.set("n", "<leader>t", function()
	toggle_terminal()
end)

vim.keymap.set("n", "<C-m>", function()
	vim.cmd("resize -2")
end)

vim.keymap.set("n", "<C-,>", function()
	vim.cmd("resize +2")
end)

local runner_map =
	{ cpp = "g++ -Wall -Wextra -Wconversion -O2 -std=c++23", zig = "zig build-exe -O ReleaseFast" }
local output_map = {
	cpp = "-o main.out",
	zig = "-femit-bin=main.out",
}
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "IN",
	callback = function()
		vim.cmd([[%s/\r//ge]])
	end,
})

local function open_file_in_popup(filepath)
	local filename = vim.fs.abspath(filepath)
	local buf = vim.fn.bufadd(filename)
	vim.fn.bufload(buf)

	local width = math.floor(vim.o.columns * 0.4)
	local height = math.floor(vim.o.lines * 0.4)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local opts = {
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = "rounded",
	}

	local win_id = vim.api.nvim_open_win(buf, true, opts)

	vim.keymap.set("n", "q", function()
		if vim.api.nvim_win_is_valid(win_id) then
			vim.api.nvim_win_close(win_id, true)
		end
	end, { buffer = buf, silent = true, desc = "Close popup window" })
end
vim.keymap.set("n", "<leader>r", function()
	local file_name = vim.api.nvim_buf_get_name(0)
	local file_type = vim.bo.filetype

	toggle_terminal()
	if term_win and runner_map[file_type] then
		vim.fn.chansend(job_id, {
			runner_map[file_type] .. " " .. file_name .. " " .. output_map[file_type] .. "\r\n",
		})
		vim.fn.chansend(job_id, {
			"sh ~/problem-solving/runner.sh\r\n",
		})

		local line_count = vim.api.nvim_buf_line_count(0)
		vim.api.nvim_win_set_cursor(term_win, { line_count, 0 })
	end
end, { desc = "Run code" })

local original_win = vim.api.nvim_get_current_win()
local open = false

vim.keymap.set("n", "<leader>i", function()
	if open then
		open = false
		local wins = vim.api.nvim_list_wins()
		for _, win in ipairs(wins) do
			if win ~= original_win then
				vim.api.nvim_win_close(win, false)
			end
		end
	else
		open = true
		vim.cmd("80vsplit ~/problem-solving/IN")
		vim.api.nvim_set_current_win(original_win)
	end
end, { desc = "Toggle input" })
