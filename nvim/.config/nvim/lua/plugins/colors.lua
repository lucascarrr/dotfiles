local selected = "verc" -- options: "lucy", "flexoki", "earlgrey", "zenbones"

local colorschemes = {
	lucy = {
		"Yazeed1s/oh-lucy.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme oh-lucy")
		end,
	},
	verc = {
		"lucascarrr/vercel-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("dark_notify").run({
				schemes = {
					dark = "vercel-dark",
					light = "vercel-light",
				},
			})
		end,
	},

	flexoki = {
		"kepano/flexoki-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("dark_notify").run({
				schemes = {
					dark = "flexoki-dark",
					light = "flexoki-light",
				},
			})
		end,
	},
	zenbones = {
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		lazy = false,
		priority = 1000,
		config = function()
			require("dark_notify").run({
				schemes = {
					dark = "zenbones",
					light = "zenbones",
				},
			})
		end,
	},
	nightfox = {
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("dark_notify").run({
				schemes = {
					dark = "terafox",
					light = "dayfox",
				},
			})
		end,
	},
	earlgrey = {
		"lucascarrr/vim-earl-grey",
		lazy = false,
		priority = 1000,
		config = function()
			require("dark_notify").run({
				schemes = {
					dark = "vim-earl-grey-dark",
					light = "vim-earl-grey",
				},
			})
		end,
	},
}

return colorschemes[selected]
