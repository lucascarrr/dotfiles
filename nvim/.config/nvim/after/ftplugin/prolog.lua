vim.bo.commentstring = "% %s"

-- Load current file into SWI-Prolog interactive session
vim.keymap.set("n", "<leader>r", function()
	local file = vim.fn.expand("%:p")
	vim.cmd("split | terminal swipl -l " .. vim.fn.shellescape(file))
end, { buffer = true, desc = "Consult file in SWI-Prolog" })
