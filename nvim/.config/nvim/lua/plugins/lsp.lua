-- LSP Configuration
-- Supported: Python, LaTeX, Typst, Markdown

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "basedpyright", "texlab", "marksman" },
			-- tinymist installed via homebrew, not mason
		})

		-- Keymaps (set on LSP attach)
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			end,
		})

		-- Python
		vim.lsp.config.basedpyright = {
			cmd = { "basedpyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = { "pyproject.toml", "setup.py", ".git" },
			settings = {
				basedpyright = {
					typeCheckingMode = "off",
				},
			},
		}

		-- LaTeX
		vim.lsp.config.texlab = {
			cmd = { "texlab" },
			filetypes = { "tex", "bib" },
			root_markers = { ".git", ".latexmkrc" },
			settings = {
				texlab = {
					build = { outputDirectory = "build" },
					auxDirectory = "build",
				},
			},
		}

		-- Typst
		vim.lsp.config.tinymist = {
			cmd = { "/opt/homebrew/bin/tinymist" },
			filetypes = { "typst" },
			root_markers = { ".git" },
			settings = {
				exportPdf = "onSave",
				formatterMode = "typstyle",
			},
		}

		-- Markdown
		vim.lsp.config.marksman = {
			cmd = { "marksman", "server" },
			filetypes = { "markdown" },
			root_markers = { ".git", ".marksman.toml" },
		}

		vim.lsp.enable({ "basedpyright", "texlab", "tinymist", "marksman" })
	end,
}
