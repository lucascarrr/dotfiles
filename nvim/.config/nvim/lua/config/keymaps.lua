-- general
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", "<CMD>write<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d')
function jump_pair()
	local ext = vim.fn.expand("%:e")
	local source_exts = {
		"cpp",
		"c",
		"frag",
		"server.ts",
		"js",
		"ts",
		"jsx",
		"tsx",
		"py",
		"java",
		"rs",
		"go",
		"css",
		"scss",
		"less",
	}
	local header_exts = {
		"h",
		"hpp",
		"hh",
		"vert",
		"svelte",
		"html",
		"vue",
		"component.ts",
		"component.js",
		"types.ts",
		"interface.ts",
		"d.ts",
		"test.py",
		"spec.ts",
		"spec.js",
		"test.js",
		"test.ts",
	}
	local target_exts = nil
	if vim.tbl_contains(header_exts, ext) then
		target_exts = source_exts
	elseif vim.tbl_contains(source_exts, ext) then
		target_exts = header_exts
	else
		print("Not a recognized file pair.")
		return
	end

	local base_name = vim.fn.expand("%:r")
	for _, target_ext in ipairs(target_exts) do
		local target_file = base_name .. "." .. target_ext
		if vim.fn.filereadable(target_file) == 1 then
			vim.cmd("edit " .. target_file)
			return
		end
	end

	print("Corresponding file not found.")
end
vim.keymap.set({ "n" }, "<leader>R", ":RecordPicker<CR>", { silent = false })
vim.keymap.set("n", "<D-s>", "<cmd>VimtexTocOpen<CR>", { noremap = true, silent = true })

-- Floating terminal toggle
local term_buf = nil
local term_win = nil

local function open_float_term()
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.api.nvim_win_close(term_win, false)
		term_win = nil
		return
	end

	if not (term_buf and vim.api.nvim_buf_is_valid(term_buf)) then
		term_buf = vim.api.nvim_create_buf(false, true)
	end

	term_win = vim.api.nvim_open_win(term_buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	})

	if vim.bo[term_buf].buftype ~= "terminal" then
		vim.cmd("terminal")
	else
		vim.cmd("startinsert")
	end
end

vim.keymap.set({ "n", "t" }, "<leader>T", open_float_term, { silent = true })
