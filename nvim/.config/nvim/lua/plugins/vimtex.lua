return {
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.g.vimtex_imaps_enabled = 0
			vim.g.vimtex_view_method = "general"
			vim.g.vimtex_view_general_viewer = "sioyek"
			vim.g.vimtex_view_general_options = "--reuse-window"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_compiler_tectonic = {
				out_dir = "build",
				options = {
					"--keep-intermediates",
					"--keep-logs",
				},
			}

			-- Disable annoying stuff
			vim.g.vimtex_log_ignore =
				{ "Underfull", "Overfull", "specifier changed to", "Token not allowed in a PDF string" }
			vim.g.vimtex_quickfix_enabled = 0
			vim.g.vimtex_fold_enabled = 0
			vim.g.vimtex_format_enabled = 0

			-- Keep VimTeX's internal indent features for better cursor movement
			-- and basic structural indenting, unless it conflicts with latexindent's output.
			vim.g.vimtex_indent_enabled = 1
			vim.g.vimtex_indent_settings = {
				modify_linebreaks = 1,
				remove_trailing_whitespace = 1,
			}

			-- TOC config
			vim.g.vimtex_toc_config = {
				show_help = 0,
				mappings = {},
				layer_status = { content = 1, label = 0, include = 0 },
				tocdepth = 2,
			}

			-- REMOVED: The manual BufWritePre autocmd is removed as it conflicts
			-- with conform.nvim's format_on_save logic.
		end,
	},
}
