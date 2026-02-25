return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Add clingo parser for Answer Set Programming files
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.clingo = {
			install_info = {
				url = "https://github.com/potassco/tree-sitter-clingo",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
			},
			filetype = "clingo",
		}

		-- Filetype associations
		vim.filetype.add({
			extension = {
				lp = "clingo",
				asp = "clingo",
				pro = "prolog",
				prolog = "prolog",
			},
		})

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"python",
				"bash",
				"latex",
				"bibtex",
				"clojure",
				"typst",
				"clingo",
				"prolog",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
