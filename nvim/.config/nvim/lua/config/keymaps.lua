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
