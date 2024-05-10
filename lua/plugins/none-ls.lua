return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvimtools/none-ls-extras.nvim",
	},
	keys = {},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtin.formatting.prettier,
				null_ls.builtin.formatting.eslint_d,
				null_ls.builtins.completion.spell,
				require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})
	end,
}
