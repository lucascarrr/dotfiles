return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")

		-- Load VSCode-style snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Load your own Lua snippets
		require("luasnip.loaders.from_lua").lazy_load({
			paths = vim.fn.stdpath("config") .. "/lua/snippets",
		})

		-- Optional: so 'tex' files use latex snippets
		ls.filetype_extend("tex", { "latex" })
	end,
}
