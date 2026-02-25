require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = { notify = false },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function()
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "v:lua.TypstFold()"
		vim.opt_local.foldlevel = 99 -- start open
	end,
})

function TypstFold()
	local line = vim.fn.getline(vim.v.lnum)
	if line:match("^= ") then
		return ">1" -- section heading starts level 1 fold
	elseif line:match("^== ") then
		return ">2" -- slide heading starts level 2 fold
	else
		return "=" -- inherit from previous line
	end
end
