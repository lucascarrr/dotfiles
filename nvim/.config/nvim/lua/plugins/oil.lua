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
		-- .lp/.asp not in devicons; borrow the Prolog icon with a distinct colour
		require("nvim-web-devicons").set_icon({
			lp  = { icon = "", color = "#E77D26", cterm_color = "208", name = "Clingo" },
			asp = { icon = "", color = "#E77D26", cterm_color = "208", name = "ASP" },
		})

		require("oil").setup({})
		vim.keymap.set({ "n", "x" }, "<leader>e", function()
			require("oil").open()
		end, { silent = true })
	end,
}
