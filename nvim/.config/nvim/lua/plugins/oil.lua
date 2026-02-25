return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = false,
			show_icons = {
				file = true,
				folder = true,
				folder_empty = true,
				default = true,
			},
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-web-devicons").set_icon({
			lp = { icon = "󰡱", color = "#E77D26", name = "Clingo" },
			asp = { icon = "󰡱", color = "#E77D26", name = "ASP" },
			pro = { icon = "󰘧", color = "#6B8CFF", name = "Prolog" },
		})

		require("oil").setup({})
		vim.keymap.set({ "n", "x" }, "<leader>e", function()
			require("oil").open()
		end, { silent = true })
	end,
}
