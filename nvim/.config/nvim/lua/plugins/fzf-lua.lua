return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
		{ "<leader>r", "<cmd>FzfLua oldfiles<cr>", desc = "Find old files" },
		{ "<leader>g", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
	},
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.85,
				width = 0.80,
			},
			oldfiles = {
				cwd_only = false, -- Show oldfiles from any directory
				include_current_session = true, -- Include files from current session
			},
		})
	end,
}
