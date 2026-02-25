-- Omni Preview (Typst, Markdown)
return {
	"sylvanfranklin/omni-preview.nvim",
	dependencies = {
		{ "chomosuke/typst-preview.nvim", lazy = true },
	},
	keys = {
		{ "<leader>P", "<cmd>OmniPreview start<cr>", desc = "Preview" },
	},
	opts = {},
}
