return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				clojure = { "cljfmt" },
				tex = { "latexindent" },
				bash = { "shfmt" },
				typst = { "prettypst" }, -- Install with: cargo install prettypst
			},
			formatters = {
				latexindent = {
					command = "latexindent",
					stdin = true,
					append_args = function()
						return { "-m", "-l" }
					end,
				},
			},
			format_on_save = {
				timeout_ms = 1500,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range" })
	end,
}
