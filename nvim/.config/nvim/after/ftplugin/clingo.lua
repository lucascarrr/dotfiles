vim.bo.commentstring = "%% %s"

-- Run current file with clingo
vim.keymap.set("n", "<leader>r", function()
	local file = vim.fn.expand("%:p")
	vim.cmd("split | terminal clingo " .. vim.fn.shellescape(file))
end, { buffer = true, desc = "Run clingo" })
