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
			ensure_installed = { "ruff", "texlab", "marksman" },
			-- tinymist installed via homebrew, not mason
			-- ty installed via: uv tool install ty
		})

		-- Diagnostic display: cycle through errors-only → all → off
		local diag_level = 1
		local diag_configs = {
			{
				label = "errors only",
				cfg = {
					virtual_text = false,
					signs = { severity = { min = vim.diagnostic.severity.ERROR } },
					underline = { severity = { min = vim.diagnostic.severity.ERROR } },
					update_in_insert = false,
					float = { border = "rounded" },
				},
			},
			{
				label = "all",
				cfg = {
					virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
					signs = true,
					underline = true,
					update_in_insert = false,
					float = { border = "rounded" },
				},
			},
			{
				label = "off",
				cfg = {
					virtual_text = false,
					signs = false,
					underline = false,
					update_in_insert = false,
					float = { border = "rounded" },
				},
			},
		}

		vim.diagnostic.config(diag_configs[diag_level].cfg)

		vim.keymap.set("n", "<leader>td", function()
			diag_level = (diag_level % #diag_configs) + 1
			vim.diagnostic.config(diag_configs[diag_level].cfg)
			vim.notify("Diagnostics: " .. diag_configs[diag_level].label, vim.log.levels.INFO)
		end, { desc = "Cycle diagnostics level" })

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

		-- Python: linting + code actions
		vim.lsp.config.ruff = {
			cmd = { "ruff", "server" },
			filetypes = { "python" },
			root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
		}

		-- Python: type checking (install via: uv tool install ty)
		vim.lsp.config.ty = {
			cmd = { "ty", "server" },
			filetypes = { "python" },
			root_markers = { "pyproject.toml", ".git" },
			handlers = {
				["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
					if result and result.diagnostics then
						result.diagnostics = vim.tbl_filter(function(d)
							return d.severity == 1 -- errors only
						end, result.diagnostics)
					end
					vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
				end,
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

		-- Prolog (SWI-Prolog built-in LSP server)
		vim.lsp.config.prolog_lsp = {
			cmd = {
				"swipl",
				"-g", "use_module(library(lsp_server)),lsp_server:main",
				"-t", "halt",
				"--", "--stdio",
			},
			filetypes = { "prolog" },
			root_markers = { ".git" },
		}

		vim.lsp.enable({ "ruff", "ty", "texlab", "tinymist", "marksman", "prolog_lsp" })
	end,
}
